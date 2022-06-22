

(asdf:defsystem "common-vulkan-guide"
  :depends-on ("cl-glfw" "common-vulkan")
  :components ((:file "package")
	       (:file "code-guide/base-code")))
