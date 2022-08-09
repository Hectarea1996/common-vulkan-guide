

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

(cvk:def-debug-utils-messenger-callback debug-callback (message-severity message-type callback-data user-data)
  (declare (ignore message-severity message-type user-data))
  (warn "validation layer: ~S" (cvk:debug-utils-messenger-callback-data-pMessage callback-data))
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
   (swap-chain-extent :accessor swap-chain-extent :initform nil)))


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
      
      (cvk:with-debug-utils-messenger-create-info create-info
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
	    if (cvk:get-physical-device-surface-support device i (surface app))
	      do (setf (queue-family-indices-present-family indices) i)
	    if (is-queue-family-indices-complete indices)
	      return nil)
      indices)))

(defstruct swap-chain-support-details
  (capabilities nil)
  (formats nil)
  (present-modes nil))

(defun create-query-swap-chain-support (app device)
  (let ((capabilities (cvk:create-get-physical-device-surface-capabilities device (surface app)))
	(formats (cvk:create-get-physical-device-surface-formats device (surface app)))
	(present-modes (cvk:get-physical-device-surface-present-modes device (surface app))))
    (make-swap-chain-support-details :capabilities capabilities
				     :formats formats
				     :present-modes present-modes)))

(defun destroy-query-swap-chain-support (query-details)
  (cvk:destroy-get-physical-device-surface-capabilities (swap-chain-support-details-capabilities query-details))
  (cvk:destroy-get-physical-device-surface-formats (swap-chain-support-details-formats query-details)))

(defun choose-swap-surface-format (app available-formats)
  (declare (ignore app))
  (let ((chosen-format (loop for available-format in available-formats
				if (and (equal (cvk:surface-format-format available-format) cvk:VK_FORMAT_B8G8R8A8_SRGB)
					(equal (cvk:surface-format-colorSpace available-format) cvk:VK_COLOR_SPACE_SRGB_NONLINEAR_KHR))
				  return available-format)))
    (or chosen-format (car available-formats))))

(defun choose-swap-present-mode (app available-present-modes)
  (declare (ignore app))
  (let ((chosen-present-mode (loop for available-present-mode in available-present-modes
				   if (equal available-present-mode cvk:VK_PRESENT_MODE_MAILBOX_KHR)
				     return available-present-mode)))
    (or chosen-present-mode cvk:VK_PRESENT_MODE_FIFO_KHR)))

(defun create-choose-swap-extent (app capabilities)
  (if (not (equal (cvk:extent-2d-width (cvk:surface-capabilities-currentExtent capabilities)) UINT32_MAX))
      (let ((current-extent (cvk:surface-capabilities-currentExtent capabilities)))
	(cvk:create-extent-2d :width (cvk:extent-2d-width current-extent)
			      :height (cvk:extent-2d-height current-extent)))
      (multiple-value-bind (frame-width frame-height) (glfw:get-framebuffer-size (window app))
	(let* ((min-image-extent (cvk:surface-capabilities-minImageExtent capabilities))
	       (max-image-extent (cvk:surface-capabilities-maxImageExtent capabilities))
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
	 (image-count (if (and (> (cvk:surface-capabilities-maxImageCount (swap-chain-support-details-capabilities swap-chain-support)) 0)
			       (> (1+ (cvk:surface-capabilities-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))
				  (cvk:surface-capabilities-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))))
			  (cvk:surface-capabilities-maxImageCount (swap-chain-support-details-capabilities swap-chain-support))
			  (1+ (cvk:surface-capabilities-minImageCount (swap-chain-support-details-capabilities swap-chain-support)))))
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
	 (pre-transform (cvk:surface-capabilities-currentTransform (swap-chain-support-details-capabilities swap-chain-support))))
    (cvk:with-swapchain-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR
						 :surface (surface app)
						 :minImageCount image-count
						 :imageFormat (cvk:surface-format-format surface-format)
						 :imageColorSpace (cvk:surface-format-colorSpace surface-format)
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
      (multiple-value-bind (swap-chain result) (cvk:create-swapchain (device app) create-info nil)
	(when (not (equal result cvk:VK_SUCCESS))
	  (error "failed to create swap chain!"))
	(setf (swap-chain app) swap-chain)
	(setf (swap-chain-images app) (cvk:get-swapchain-images (device app) (swap-chain app)))
	(setf (swap-chain-image-format app) (cvk:surface-format-format surface-format))
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

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app)
  (create-swap-chain app)
  (create-image-views app))


(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)))


(defun cleanup (app)
  (loop for image-view in (swap-chain-image-views app)
	do (cvk:destroy-image-view (device app) image-view nil))
  (cvk:destroy-swapchain (device app) (swap-chain app) nil)
  (destroy-choose-swap-extent app (swap-chain-extent app))
  (cvk:destroy-device (device app) nil)
  (if *enable-validation-layers*
      (destroy-debug-utils-messenger (instance app) (debug-messenger app) nil))
  (cvk:destroy-surface (instance app) (surface app) nil)
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
				       :applicationVersion (cvk:VK_MAKE_API_VERSION 1 0 0)
				       :pEngineName "No Engine"
				       :engineVersion (cvk:VK_MAKE_API_VERSION 1 0 0)
				       :apiVersion (cvk:VK_MAKE_API_VERSION 1 0 0))

    (let ((extensions (get-required-extensions))
	  (validation-layers (if *enable-validation-layers*
				 (get-validation-layers)
				 nil)))

      (cvk:with-debug-utils-messenger-create-info debug-info
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
