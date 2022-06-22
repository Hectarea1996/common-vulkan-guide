

(in-package :cvg)

(defconstant width 800)
(defconstant height 600)

(defclass hello-triangle-application ()
  ((window :accessor window :initform nil)))


(defun init-vulkan (app))

(defun main-loop (app)
  (loop while (not (glfw:window-should-close (window app)))
	do (glfw:poll-events)))

(defun cleanup (app)
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


(defun main ()
  (let ((app (make-instance 'hello-triangle-application)))
    (run app)))
