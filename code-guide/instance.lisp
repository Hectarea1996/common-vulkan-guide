

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)
   (instance :accessor instance :initform nil)))

(defun init-vulkan (app)
  (create-instance app))

(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)))

(defun cleanup (app)
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
  (cvk:with-application-info app-info (:sType cvk:VK_STRUCTURE_TYPE_APPLICATION_INFO
				       :pApplicationName "Hello triangle"
				       :applicationVersion (cvk:VK_MAKE_API_VERSION 0 1 0 0)
				       :pEngineName "No Engine"
				       :engineVersion (cvk:VK_MAKE_API_VERSION 0 1 0 0)
				       :apiVersion cvk:VK_API_VERSION_1_0)

    (let ((glfw-extensions (glfw:get-required-instance-extensions)))

      (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						  :pApplicationInfo app-info
						  :enabledExtensionCount (length glfw-extensions)
						  :ppEnabledExtensionNames glfw-extensions)

	(multiple-value-bind (instance result) (cvk:create-instance create-info nil)
	  
	  (if (not (equal result cvk:VK_SUCCESS))
	      (error "Failed to create instance"))

	  (setf (instance app) instance)))))

  (format t "available extensions:~%")
  (cvk:with-enumerate-instance-extension-properties extension-props (nil)
    (loop for extension-prop in extension-props
	  do (format t "  ~S~%" (cvk:extension-properties-extensionName extension-prop)))))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
