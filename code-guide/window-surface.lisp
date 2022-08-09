

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defvar *enable-validation-layers* t)

(defun get-validation-layers ()
  (list "VK_LAYER_KHRONOS_validation"))


(defun get-required-extensions ()
  (let* ((glfw-extensions (glfw:get-required-instance-extensions))
	 (extensions (if *enable-validation-layers*
			 (cons cvk:VK_EXT_DEBUG_UTILS_EXTENSION_NAME glfw-extensions)
			 glfw-extensions)))
    extensions))


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
   (present-queue :accessor present-queue :initform nil)))


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


(defun is-device-suitable (app device)
  (let ((indices (find-queue-families app device)))
    (is-queue-family-indices-complete indices)))

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
						    :enabledExtensionCount 0
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

(defun init-vulkan (app)
  (create-instance app)
  (setup-debug-messenger app)
  (create-surface app)
  (pick-physical-device app)
  (create-logical-device app))


(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)))


(defun cleanup (app)
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
