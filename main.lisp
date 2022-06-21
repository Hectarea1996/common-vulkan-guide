

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
				       :applicationVersion (cvk:make-version 1 0 0)
				       :pEngineName "No Engine"
				       :engineVersion (cvk:make-version 1 0 0)
				       :apiVersion (cvk:make-version 1 0 0))
    
    (cvk:with-instance-create-info create-info (:sType cvk:VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						:pApplicationInfo app-info)

      (let ((glfw-extensions (glfw:get-required-instance-extensions)))

	(setf (cvk:instance-create-info-enabledExtensionCount create-info) (length glfw-extensions))
	(setf (cvk:instance-create-info-ppEnabledExtensionNames create-info) glfw-extensions)

	(setf (cvk:instance-create-info-enabledLayerCount create-info) 0)

	(multiple-value-bind (instance result) (cvk:create-instance create-info nil)
	  
	  (if (not (equal result cvk:VK_SUCCESS))
	      (error "Failed to create instance"))

	  (setf (instance app) instance))))))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
