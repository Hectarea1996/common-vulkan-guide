

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)))

(defgeneric init-vulkan (obj))
(defgeneric main-loop (obj))
(defgeneric cleanup (obj))
(defgeneric run (obj))
(defgeneric init-window (obj))

(defmethod init-vulkan ((obj hello-triangle-application)))

(defmethod main-loop ((obj hello-triangle-application))
  (loop while (not (glfw:window-should-close (window obj)))
	do (glfw:poll-events)))

(defmethod cleanup ((obj hello-triangle-application))
  (glfw:destroy-window (window obj))
  (glfw:terminate))

(defmethod run ((obj hello-triangle-application))
  (init-window obj)
  (init-vulkan obj)
  (main-loop obj)
  (cleanup obj))

(defmethod init-window ((obj hello-triangle-application))
  (glfw:init)
  
  (glfw:window-hint glfw:GLFW_CLIENT_API glfw:GLFW_NO_API)
  (glfw:window-hint glfw:GLFW_RESIZABLE glfw:GLFW_FALSE)

  (setf (window obj) (glfw:create-window width height "Vulkan" nil nil)))


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
