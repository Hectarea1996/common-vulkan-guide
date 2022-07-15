
(asdf:load-system "cffi")

(defun rec-substitute (assoc-symbols l)
  (cond
    ((and (symbolp l) (member l assoc-symbols)) (getf assoc-symbols l))
    ((consp l) (cons (rec-substitute assoc-symbols (car l)) (rec-substitute assoc-symbols (cdr l))))
    (t l)))

(defun get-unions ()
  (with-open-file (stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/unions.lisp"
			  :direction :input)
    (loop for union-info = (read stream nil)
	  while union-info
	  collect (cadr union-info))))

(defun get-structs ()
  (with-open-file (stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/structs.lisp"
			  :direction :input)
    (loop for struct-info = (read stream nil)
	  while struct-info
	  collect (cadr struct-info))))

(defun create-final-structs ()
  (let* ((unions (get-unions))
	 (assoc-unions (apply #'append (mapcar #'list unions (mapcar (lambda (x) (list :union x)) unions))))
	 (structs (get-structs))
	 (assoc-structs (apply #'append (mapcar #'list structs (mapcar (lambda (x) (list :struct x)) structs))))
	 (assoc-list (append assoc-unions assoc-structs))
	 (*print-case* :downcase))
    (with-open-file (final-stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/final-structs.lisp"
			    :direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file (stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/structs.lisp"
			     :direction :input)
	(loop for struct-info = (read stream nil)
	      while struct-info
	      for final-struct-info = `(,(car struct-info) ,(cadr struct-info) ,@(rec-substitute assoc-list
												 (cddr struct-info)))
	      
	      do (format final-stream "~%~s~%" final-struct-info ))))))

(defun create-final-functions ()
  (let* ((unions (get-unions))
	 (assoc-unions (apply #'append (mapcar #'list unions (mapcar (lambda (x) (list :union x)) unions))))
	 (structs (get-structs))
	 (assoc-structs (apply #'append (mapcar #'list structs (mapcar (lambda (x) (list :struct x)) structs))))
	 (assoc-list (append assoc-unions assoc-structs))
	 (*print-case* :downcase))
    (with-open-file (final-stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/final-functions.lisp"
			    :direction :output :if-exists :supersede :if-does-not-exist :create)
      (with-open-file (stream "/home/hectarea/quicklisp/local-projects/common-vulkan/vulkan/functions.lisp"
			     :direction :input)
	(loop for function-info = (read stream nil)
	      while function-info
	      for final-function-info = (rec-substitute assoc-list function-info)
	      
	      do (format final-stream "~%~s~%" final-function-info ))))))
