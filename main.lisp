

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defclass hello-triangle-application ()
  ((window :accessor window :initform nil))
  ((instance :accessor instance :initform nil)))

(defmethod init-vulkan (obj)
  (create-instance))

(defmethod main-loop (obj)
  (loop while (not (glfw:window-should-close (window obj)))
	do (glfw:poll-events)))

(defmethod cleanup (obj)
  (glfw:destroy-window (window obj))
  (glfw:terminate))

(defmethod run (obj)
  (init-window obj)
  (init-vulkan obj)
  (main-loop obj)
  (cleanup obj))

(defmethod init-window (obj)
  (glfw:init)
  
  (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
  (glfw:window-hint glfw:GLFW_RESIZABLE glfw:GLFW_FALSE)

  (setf (window obj) (glfw:create-window width height "Vulkan" nil nil)))


(defun create-instance (obj)
  (cvk:with-application-info app-info (:sType VK_STRUCTURE_TYPR_APPLICATION_INFO
				       :pAppicationName "Hello triangle"
				       :applicationVersion (cvk:make-version 1 0 0)
				       :pEngineName "No Engine"
				       :engineVersion (cvk:make-version 1 0 0)
				       :apiVersion (cvk:make-version 1 0 0))
    
    (cvk:with-instance-create-info create-info (:sType VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO
						:pApplicationInfo app-info)

      (let ((glfw-extensions (glfw:get-required-instance-extensions)))

	(setf (instance-create-info-enabledExtensionCount create-info) (length glfw-extensions))
	(setf (instance-create-info-ppEnabledExtensionNames create-info) glfw-extensions)

	(setf (instance-create-info-enabledLayerCount create-info) 0)

	(multiple-value-bind (instance result) (cvk:create-instance create-info)
	  
	  (if (not (equal result cvk:VK_SUCCESS))
	      (error "Failed to create instance"))

	  (setf (instance obj) instance))))))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
