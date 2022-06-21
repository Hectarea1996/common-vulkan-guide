

(asdf:defsystem "commo-vulkan-guide"
  :depends-on ("cl-glfw" "common-vulkan")
  :components ((:file "package")
	       (:file "main")))
