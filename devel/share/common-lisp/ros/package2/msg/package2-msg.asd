
(cl:in-package :asdf)

(defsystem "package2-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TurtleSpeed" :depends-on ("_package_TurtleSpeed"))
    (:file "_package_TurtleSpeed" :depends-on ("_package"))
  ))