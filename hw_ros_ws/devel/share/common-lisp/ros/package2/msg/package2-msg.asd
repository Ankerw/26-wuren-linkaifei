
(cl:in-package :asdf)

(defsystem "package2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "turtle_linear_speed" :depends-on ("_package_turtle_linear_speed"))
    (:file "_package_turtle_linear_speed" :depends-on ("_package"))
  ))