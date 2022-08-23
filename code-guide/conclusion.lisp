

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defconstant UINT32_MAX #.(1- (expt 2 32)))

(defvar *enable-validation-layers* t)

(defun get-validation-layers ()
  (list "VK_LAYER_KHRONOS_validation"))

(defun get-required-extensions ()
  (let* ((glfw-extensions (glfw:get-required-instance-extensions))
	 (extensions (if *enable-validation-layers*
			 (cons cvk:VK_EXT_DEBUG_UTILS_EXTENSION_NAME glfw-extensions)
			 glfw-extensions)))
    extensions))

(defun get-device-extensions ()
  (list cvk:VK_KHR_SWAPCHAIN_EXTENSION_NAME))

(cvk:def-debug-utils-messenger-callback-ext-callback debug-callback (message-severity message-type callback-data user-data)
  (declare (ignore message-severity message-type user-data))
  (warn "validation layer: ~S" (cvk:debug-utils-messenger-callback-data-ext-pmessage callback-data))
  cvk:VK_FALSE)


(defun check-validation-layer-support ()
  (cvk:with-enumerate-instance-layer-properties available-layers ()
    (loop for layer-name in (get-validation-layers)
	  always (loop for layer-properties in available-layers
			 thereis (string= layer-name (cvk:layer-properties-layerName layer-properties))))))


(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)
   (instance :accessor instance :initform nil)
   (debug-messenger :accessor debug-messenger :initform nil)
   (surface :accessor surface :initform nil)
   (physical-device :accessor physical-device :initform nil)
   (device :accessor device :initform nil)
   (graphics-queue :accessor graphics-queue :initform nil)
   (present-queue :accessor present-queue :initform nil)
   (swap-chain :accessor swap-chain :initform nil)
   (swap-chain-images :accessor swap-chain-images :initform nil)
   (swap-chain-image-views :accessor swap-chain-image-views :initform nil)
   (swap-chain-image-format :accessor swap-chain-image-format :initform nil)
   (swap-chain-extent :accessor swap-chain-extent :initform nil)
   (render-pass :accessor render-pass :initform nil)
   (pipeline-layout :accessor pipeline-layout :initform nil)
   (graphics-pipeline :accessor graphics-pipeline :initform nil)))


(defun create-debug-utils-messenger (instance create-info allocator)
  (let ((func (cvk:get-instance-proc-addr instance "vkCreateDebugUtilsMessengerEXT")))
    (if func
	(funcall func instance create-info allocator)
	(values nil cvk:VK_ERROR_EXTENSION_NOT_PRESENT))))


(defun destroy-debug-utils-messenger (instance debug-messenger allocator)
  (let ((func (cvk:get-instance-proc-addr instance "vkDestroyDebugUtilsMessengerEXT")))
    (if func
	(funcall func instance debug-messenger allocator)
	(values nil cvk:VK_ERROR_EXTENSION_NOT_PRESENT))))


(defun setup-debug-messenger (app)
  (if *enable-validation-layers*
      
      (cvk:with-debug-utils-messenger-create-info-ext create-info
	(:sType cvk:VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
	 :messageSeverity (logior cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT
				  cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
				  cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
	 :messageType (logior cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT
			      cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT
			      cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)
	 :pfnUserCallback 'debug-callback
	 :pUserData nil)
	
	(multiple-value-bind (messenger result) (create-debug-utils-messenger (instance app) create-info nil)
	  (if (not (equal result cvk:VK_SUCCESS))
	      (error "failed to set up debug messenger! ~S" result))
	  (setf (debug-messenger app) messenger)))))


(defstruct queue-family-indices
  (graphics-family nil)
  (present-family nil))

(defun is-queue-family-indices-complete (indices)
  (and (queue-family-indices-graphics-family indices)
       (queue-family-indices-present-family indices)))

(defun find-queue-families (app device)
  (let ((indices (make-queue-family-indices)))
    (cvk:with-get-physical-device-queue-family-properties queue-families (device)
      (loop for queue-family in queue-families
	    for i from 0
	    if (not (zerop (logand (cvk:queue-family-properties-queueFlags queue-family)
				   cvk:VK_QUEUE_GRAPHICS_BIT)))
	      do (setf (queue-family-indices-graphics-family indices) i)
	    if (cvk:get-physical-device-surface-support-khr device i (surface app))
	      do (setf (queue-family-indices-present-family indices) i)
	    if (is-queue-family-indices-complete indices)
	      return nil)
      indices)))

(defstruct swap-chain-support-details
  (capabilities nil)
  (formats nil)
  (present-modes nil))

(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities-khr device (surface app)))
	(formats (cvk:create-get-physical-device-surface-formats-khr device (surface app)))
	(present-modes (cvk:get-physical-device-surface-present-modes-khr device (surface app))))
    (make-swap-chain-support-details :capabilities capabilities
				     :formats formats
				     :present-modes present-modes)))

(defun destroy-query-swap-chain-support (query-details)
  (cvk:destroy-get-physical-device-surface-capabilities-khr (swap-chain-support-details-capabilities query-details))
  (cvk:destroy-get-physical-device-surface-formats-khr (swap-chain-support-details-formats query-details)))

(defun choose-swap-surface-format (app available-formats)
  (declare (ignore app))
  (let ((chosen-format (loop for available-format in available-formats
				if (and (equal (cvk:surface-format-khr-format available-format) cvk:VK_FORMAT_B8G8R8A8_SRGB)
					(equal (cvk:surface-format-khr-colorSpace available-format) cvk:VK_COLOR_SPACE_SRGB_NONLINEAR_KHR))
				  return available-format)))
    (or chosen-format (car available-formats))))

(defun choose-swap-present-mode (app available-present-modes)
  (declare (ignore app))
  (let ((chosen-present-mode (loop for available-present-mode in available-present-modes
				   if (equal available-present-mode cvk:VK_PRESENT_MODE_MAILBOX_KHR)
				     return available-present-mode)))
    (or chosen-present-mode cvk:VK_PRESENT_MODE_FIFO_KHR)))

(defun create-choose-swap-extent (app capabilities)
  (if (not (equal (cvk:extent-2d-width (cvk:surface-capabilities-khr-currentExtent capabilities)) UINT32_MAX))
      (let ((current-extent (cvk:surface-capabilities-khr-currentExtent capabilities)))
	(cvk:create-extent-2d :width (cvk:extent-2d-width current-extent)
			      :height (cvk:extent-2d-height current-extent)))
      (multiple-value-bind (frame-width frame-height) (glfw:get-framebuffer-size (window app))
	(let* ((min-image-extent (cvk:surface-capabilities-khr-minImageExtent capabilities))
	       (max-image-extent (cvk:surface-capabilities-khr-maxImageExtent capabilities))
	       (min-width (cvk:extent-2d-width min-image-extent))
	       (min-height (cvk:extent-2d-height min-image-extent))
	       (max-width (cvk:extent-2d-width max-image-extent))
	       (max-height (cvk:extent-2d-height max-image-extent)))
	  (cvk:create-extent-2d :width (cond
					 ((> frame-width max-width) max-width)
					 ((< frame-width min-width) min-width)
					 (t frame-width))
				:height (cond
					  ((> frame-height max-height) max-height)
					  ((< frame-height min-height) min-height)
					  (t frame-height)))))))

(defun destroy-choose-swap-extent (app extent)
  (declare (ignore app))
  (cvk:destroy-extent-2d extent))

(defun check-device-extension-support (app device)
  (declare (ignore app))
  (cvk:with-enumerate-device-extension-properties available-extensions (device nil)
    (let ((required-extensions (get-device-extensions)))
      (loop for required-extension in required-extensions
	    always (member required-extension available-extensions :key #'cvk:extension-properties-extensionName :test #'string=)))))

(defun is-device-suitable (app device)
  (let* ((indices (find-queue-families app device))
	 (extension-supported (check-device-extension-support app device))
	 (swap-chain-support (create-query-swap-chain-support app device))
	 (swap-chain-adequate (and (not (null (swap-chain-support-details-formats swap-chain-support)))
				   (not (null (swap-chain-support-details-present-modes swap-chain-support))))))
    (destroy-query-swap-chain-support swap-chain-support)
    (and (is-queue-family-indices-complete indices)
	 extension-supported
	 swap-chain-adequate)))

(defun pick-physical-device (app)
  (let ((devices (cvk:enumerate-physical-devices (instance app))))
    (if (null devices)
	(error "failed to find GPUs with Vulkan support!"))
    (loop for device in devices
	  if (is-device-suitable app device)
	    do (setf (physical-device app) device)
	    and return nil)
    (if (not (physical-device app))
	(error "failed to find a suitable GPU!"))))

(defun create-logical-device (app)
  (let* ((indices (find-queue-families app (physical-device app)))
	 (unique-queue-families (remove-duplicates (list (queue-family-indices-graphics-family indices)
							 (queue-family-indices-present-family indices))))
	 (queue-create-infos (loop for queue-family in unique-queue-families
				   collect (cvk:create-device-queue-create-info
					    :sType cvk:VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO
					    :queueFamilyIndex queue-family
					    :queueCount 1
					    :pQueuePriorities (list 1.0)))))
     (cvk:with-physical-device-features device-features ()
	(let ((enabled-layer-names (if *enable-validation-layers*
				       (get-validation-layers)
				       nil)))
	  (cvk:with-device-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO
						    :pQueueCreateInfos queue-create-infos
						    :queueCreateInfoCount (length queue-create-infos)
						    :pEnabledFeatures device-features
						    :enabledExtensionCount (length (get-device-extensions))
						    :ppEnabledExtensionNames (get-device-extensions)
						    :enabledLayerCount (length enabled-layer-names)
						    :ppEnabledLayerNames enabled-layer-names)
	    (multiple-value-bind (device result) (cvk:create-device (physical-device app) create-info nil)
	      (when (not (equal result cvk:VK_SUCCESS))
		(error "failed to create logical device!"))
	      (setf (device app) device)
	      (setf (graphics-queue app) (cvk:get-device-queue device (queue-family-indices-graphics-family indices) 0))
	      (setf (present-queue app) (cvk:get-device-queue device (queue-family-indices-present-family indices) 0))))))
    (loop for queue-create-info in queue-create-infos
	  do (cvk:destroy-device-queue-create-info queue-create-info))))

(defun create-surface (app)
  (multiple-value-bind (surface result) (glfw:create-window-surface (instance app) (window app) nil)
    (when (not (equal result cvk:VK_SUCCESS))
      (error "failed to create widnow surface!"))
    (setf (surface app) surface)))

(defun create-swap-chain (app)
  (let* ((swap-chain-support (create-query-swap-chain-support app (physical-device app)))
	 (surface-format (choose-swap-surface-format app (swap-chain-support-details-formats swap-chain-support)))
	 (present-mode (choose-swap-present-mode app (swap-chain-support-details-present-modes swap-chain-support)))
	 (extent (create-choose-swap-extent app (swap-chain-support-details-capabilities swap-chain-support)))
	 (image-count (if (and (> (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support)) 0)
			       (> (1+ (cvk:surface-capabilities-khr-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))
				  (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))))
			  (cvk:surface-capabilities-khr-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))
			  (1+ (cvk:surface-capabilities-khr-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))))
	 (indices (find-queue-families app (physical-device app)))
	 (family-indices-list (list (queue-family-indices-graphics-family indices)
				    (queue-family-indices-present-family indices)))
	 (equal-families-p (equal (queue-family-indices-graphics-family indices)
				  (queue-family-indices-present-family indices)))
	 (sharing-mode (if (not equal-families-p)
			   cvk:VK_SHARING_MODE_CONCURRENT
			   cvk:VK_SHARING_MODE_EXCLUSIVE))
	 (queue-family-index-count (if (not equal-families-p) 2 0))
	 (family-indices (if (not equal-families-p) family-indices-list nil))
	 (pre-transform (cvk:surface-capabilities-khr-currentTransform (swap-chain-support-details-capabilities swap-chain-support))))
    (cvk:with-swapchain-create-info-khr create-info (:sType cvk:VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
						 :surface (surface app)
						 :minImageCount image-count
						 :imageFormat (cvk:surface-format-khr-format surface-format)
						 :imageColorSpace (cvk:surface-format-khr-colorSpace surface-format)
						 :imageExtent extent
						 :imageArrayLayers 1
						 :imageUsage cvk:VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT
						 :imageSharingMode sharing-mode
						 :queueFamilyIndexCount queue-family-index-count
						 :pQueueFamilyIndices family-indices
						 :preTransform pre-transform
						 :compositeAlpha cvk:VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR
						 :presentMode present-mode
						 :clipped cvk:VK_TRUE
						 :oldSwapchain nil)
      (multiple-value-bind (swap-chain result) (cvk:create-swapchain-khr (device app) create-info nil)
	(when (not (equal result cvk:VK_SUCCESS))
	  (error "failed to create swap chain!"))
	(setf (swap-chain app) swap-chain)
	(setf (swap-chain-images app) (cvk:get-swapchain-images-khr (device app) (swap-chain app)))
	(setf (swap-chain-image-format app) (cvk:surface-format-khr-format surface-format))
	(setf (swap-chain-extent app) extent)
	(destroy-query-swap-chain-support swap-chain-support)))))

(defun create-image-views (app)
  (loop for image in (swap-chain-images app)
	collect (cvk:with-component-mapping component (:r cvk:VK_COMPONENT_SWIZZLE_IDENTITY
						       :g cvk:VK_COMPONENT_SWIZZLE_IDENTITY
						       :b cvk:VK_COMPONENT_SWIZZLE_IDENTITY
						       :a cvk:VK_COMPONENT_SWIZZLE_IDENTITY)
		  (cvk:with-image-subresource-range subresource (:aspectMask cvk:VK_IMAGE_ASPECT_COLOR_BIT
								 :baseMipLevel 0
								 :levelCount 1
								 :baseArrayLayer 0
								 :layerCount 1)
		    (cvk:with-image-view-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO
								  :image image
								  :viewType cvk:VK_IMAGE_VIEW_TYPE_2D
								  :format (swap-chain-image-format app)
								  :components component
								  :subresourceRange subresource)
		      (multiple-value-bind (image-view result) (cvk:create-image-view (device app) create-info nil)
			(when (not (equal result cvk:VK_SUCCESS))
			  (error "failed to create image views!"))
			image-view))))
	  into image-views
	finally (setf (swap-chain-image-views app) image-views)))

(defun create-shader-module (app code size)
  (cvk:with-shader-module-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO
						   :codeSize size
						   :pCode code)
    (multiple-value-bind (shader-module result) (cvk:create-shader-module (device app) create-info nil)
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create shader module!"))
      shader-module)))

(defun create-render-pass (app)
  (cvk:with-attachment-description color-attachment (:format (swap-chain-image-format app)
						     :samples cvk:VK_SAMPLE_COUNT_1_BIT
						     :loadOp cvk:VK_ATTACHMENT_LOAD_OP_CLEAR
						     :storeOp cvk:VK_ATTACHMENT_STORE_OP_STORE
						     :stencilLoadOp cvk:VK_ATTACHMENT_LOAD_OP_DONT_CARE
						     :stencilStoreOp cvk:VK_ATTACHMENT_STORE_OP_DONT_CARE
						     :initialLayout cvk:VK_IMAGE_LAYOUT_UNDEFINED
						     :finalLayout cvk:VK_IMAGE_LAYOUT_PRESENT_SRC_KHR)
    (cvk:with-attachment-reference color-attachment-ref (:attachment 0
							 :layout cvk:VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL)
      (cvk:with-subpass-description subpass (:pipelineBindPoint cvk:VK_PIPELINE_BIND_POINT_GRAPHICS
					     :colorAttachmentCount 1
					     :pColorAttachments (list color-attachment-ref))
	(cvk:with-render-pass-create-info render-pass-info (:sType cvk:VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO
							    :attachmentCount 1
							    :pAttachments (list color-attachment)
							    :subpassCount 1
							    :pSubpasses (list subpass))
	  (multiple-value-bind (render-pass result) (cvk:create-render-pass (device app) render-pass-info nil)
	    (when (not (equal result cvk:VK_SUCCESS))
	      (error "failed to create render pass!"))
	    (setf (render-pass app) render-pass)))))))

(defun create-graphics-pipeline (app)
  (uiop:nest
      (cvk:with-spv-code (vert-shader-code vert-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/vert.spv")))
    (cvk:with-spv-code (frag-shader-code frag-size) ((asdf:system-relative-pathname "common-vulkan-guide" "shaders/frag.spv")))
    (let ((vert-shader-module (create-shader-module app vert-shader-code vert-size))
	  (frag-shader-module (create-shader-module app frag-shader-code frag-size))))
    (cvk:with-pipeline-shader-stage-create-info vert-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
									:stage cvk:VK_SHADER_STAGE_VERTEX_BIT
									:module vert-shader-module
									:pName "main"))
    (cvk:with-pipeline-shader-stage-create-info frag-shader-stage-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO
									:stage cvk:VK_SHADER_STAGE_FRAGMENT_BIT
									:module frag-shader-module
									:pName "main"))
    (let ((shader-stages (list vert-shader-stage-info frag-shader-stage-info))
	  (dynamic-states (list cvk:VK_DYNAMIC_STATE_VIEWPORT cvk:VK_DYNAMIC_STATE_SCISSOR))))
    (cvk:with-pipeline-dynamic-state-create-info dynamic-state (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO
								:dynamicStateCount (length dynamic-states)
								:pDynamicStates dynamic-states))
    (cvk:with-pipeline-vertex-input-state-create-info vertex-input-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO
									 :vertexBindingDescriptionCount 0
									 :pVertexBindingDescriptions nil
									 :vertexAttributeDescriptionCount 0
									 :pVertexAttributeDescriptions nil))
    (cvk:with-pipeline-input-assembly-state-create-info input-assembly (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO
									:topology cvk:VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST
									:primitiveRestartEnable cvk:VK_FALSE))
    (cvk:with-viewport viewport (:x 0.0
				 :y 0.0
				 :width (float (cvk:extent-2d-width (swap-chain-extent app)))
				 :height (float (cvk:extent-2d-height (swap-chain-extent app)))
				 :minDepth 0.0
				 :maxDepth 1.0))
    (cvk:with-offset-2d scissor-offset (:x 0
					:y 0))
    (cvk:with-rect-2d scissor (:offset scissor-offset
			       :extent (swap-chain-extent app)))
    (cvk:with-pipeline-viewport-state-create-info viewport-state (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO
								  :viewportCount 1
								  :pViewports (list viewport)
								  :scissorCount 1
								  :pScissors (list scissor)))
    (cvk:with-pipeline-rasterization-state-create-info rasterizer (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO
								   :depthClampEnable cvk:VK_FALSE
								   :rasterizerDiscardEnable cvk:VK_FALSE
								   :polygonMode cvk:VK_POLYGON_MODE_FILL
								   :lineWidth 1.0
								   :cullMode cvk:VK_CULL_MODE_BACK_BIT
								   :frontFace cvk:VK_FRONT_FACE_CLOCKWISE
								   :depthBiasEnable cvk:VK_FALSE
								   :depthBiasConstantFactor 0.0
								   :depthBiasClamp 0.0
								   :depthBiasSlopeFactor 0.0))
    (cvk:with-pipeline-multisample-state-create-info multisampling (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO
								    :sampleShadingEnable cvk:VK_FALSE
								    :rasterizationSamples cvk:VK_SAMPLE_COUNT_1_BIT
								    :minSampleShading 1.0
								    :pSampleMask nil
								    :alphaToCoverageEnable cvk:VK_FALSE
								    :alphaToOneEnable cvk:VK_FALSE))
    (cvk:with-pipeline-color-blend-attachment-state color-blend-attachment (:colorWriteMask (logior cvk:VK_COLOR_COMPONENT_R_BIT
												    cvk:VK_COLOR_COMPONENT_G_BIT
												    cvk:VK_COLOR_COMPONENT_B_BIT
												    cvk:VK_COLOR_COMPONENT_A_BIT)
									    :blendEnable cvk:VK_FALSE
									    :srcColorBlendFactor cvk:VK_BLEND_FACTOR_ONE
									    :dstColorBlendFactor cvk:VK_BLEND_FACTOR_ZERO
									    :colorBlendOp cvk:VK_BLEND_OP_ADD
									    :srcAlphaBlendFactor cvk:VK_BLEND_FACTOR_ONE
									    :dstAlphaBlendFactor cvk:VK_BLEND_FACTOR_ZERO
									    :alphaBlendOp cvk:VK_BLEND_OP_ADD))
    (cvk:with-pipeline-color-blend-state-create-info color-blending (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO
								     :logicOpEnable cvk:VK_FALSE
								     :logicOp cvk:VK_LOGIC_OP_COPY
								     :attachmentCount 1
								     :pAttachments (list color-blend-attachment)
								     :blendConstants (list 0.0 0.0 0.0 0.0)))
    (cvk:with-pipeline-layout-create-info pipeline-layout-info (:sType cvk:VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO
								:setLayoutCount 0
								:pSetLayouts nil
								:pushConstantRangeCount 0
								:pPushConstantRanges nil))
    (multiple-value-bind (pipeline-layout result) (cvk:create-pipeline-layout (device app) pipeline-layout-info nil))
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create pipeline layout!"))
      (setf (pipeline-layout app) pipeline-layout))
    (cvk:with-graphics-pipeline-create-info pipeline-info (:sType cvk:VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO
							   :stageCount 2
							   :pStages shader-stages
							   :pVertexInputState vertex-input-info
							   :pInputAssemblyState input-assembly
							   :pViewportState viewport-state
							   :pRasterizationState rasterizer
							   :pMultisampleState multisampling
							   :pDepthStencilState nil
							   :pColorBlendState color-blending
							   :pDynamicState dynamic-state
							   :layout pipeline-layout
							   :renderPass (render-pass app)
							   :subpass 0
							   :basePipelineHandle nil
							   :basePipelineIndex -1))
    (multiple-value-bind (graphics-pipelines result) (cvk:create-graphics-pipelines (device app) nil (list pipeline-info) nil))
    (progn
      (when (not (equal result cvk:VK_SUCCESS))
	(error "failed to create graphics pipeline!"))
      (setf (graphics-pipeline app) (car graphics-pipelines))
      (cvk:destroy-shader-module (device app) frag-shader-module nil)
      (cvk:destroy-shader-module (device app) vert-shader-module nil))))

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app)
  (create-render-pass app)
  (create-graphics-pipeline app))


(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)))


(defun cleanup (app)
  (cvk:destroy-pipeline (device app) (graphics-pipeline app) nil)
  (cvk:destroy-pipeline-layout (device app) (pipeline-layout app) nil)
  (cvk:destroy-render-pass (device app) (render-pass app) nil)
  (loop for image-view in (swap-chain-image-views app)
	do (cvk:destroy-image-view (device app) image-view nil))
  (cvk:destroy-swapchain-khr (device app) (swap-chain app) nil)
  (destroy-choose-swap-extent app (swap-chain-extent app))
  (cvk:destroy-device (device app) nil)
  (if *enable-validation-layers*
      (destroy-debug-utils-messenger (instance app) (debug-messenger app) nil))
  (cvk:destroy-surface-khr (instance app) (surface app) nil)
  (cvk:destroy-instance (instance app) nil)
  (glfw:destroy-window (window app))
  (glfw:terminate))



(defun run (app)
  (init-window app)
  (init-vulkan app)
  (main-loop app)
  (cleanup app))


(defun init-window (app)
  (glfw:init)
  
  (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
  (glfw:window-hint glfw:GLFW_RESIZABLE glfw:GLFW_FALSE)

  (setf (window app) (glfw:create-window width height "Vulkan" nil nil)))


(defun create-instance (app)

  (if (and *enable-validation-layers* (not (check-validation-layer-support)))
      (error "validation layers requested, but not available!"))
  
  (cvk:with-application-info app-info (:sType cvk:VK_STRUCTURE_TYPE_APPLICATION_INFO
				       :pApplicationName "Hello triangle"
				       :applicationVersion (cvk:VK_MAKE_API_VERSION 0 1 0 0)
				       :pEngineName "No Engine"
				       :engineVersion (cvk:VK_MAKE_API_VERSION 0 1 0 0)
				       :apiVersion (cvk:VK_MAKE_API_VERSION 0 1 0 0))

    (let ((extensions (get-required-extensions))
	  (validation-layers (if *enable-validation-layers*
				 (get-validation-layers)
				 nil)))

      (cvk:with-debug-utils-messenger-create-info-ext debug-info
	  (:sType cvk:VK_STRUCTURE_TYPE_DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT
	   :messageSeverity (logior cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_VERBOSE_BIT_EXT
				    cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_WARNING_BIT_EXT
				    cvk:VK_DEBUG_UTILS_MESSAGE_SEVERITY_ERROR_BIT_EXT)
	   :messageType (logior cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_GENERAL_BIT_EXT
				cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_VALIDATION_BIT_EXT
				cvk:VK_DEBUG_UTILS_MESSAGE_TYPE_PERFORMANCE_BIT_EXT)
	   :pfnUserCallback 'debug-callback
	   :pUserData nil)
	
	(cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						    :pNext debug-info
						    :pApplicationInfo app-info
						    :enabledExtensionCount (length extensions)
						    :ppEnabledExtensionNames extensions
						    :enabledLayerCount (length validation-layers)
						    :ppEnabledLayerNames validation-layers)

	  (multiple-value-bind (instance result) (cvk:create-instance create-info nil)
	    
	    (if (not (equal result cvk:VK_SUCCESS))
		(error "Failed to create instance"))

	    (setf (instance app) instance)))))))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
