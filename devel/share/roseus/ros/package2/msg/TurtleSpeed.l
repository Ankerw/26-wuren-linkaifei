;; Auto-generated. Do not edit!


(when (boundp 'package2::TurtleSpeed)
  (if (not (find-package "PACKAGE2"))
    (make-package "PACKAGE2"))
  (shadow 'TurtleSpeed (find-package "PACKAGE2")))
(unless (find-package "PACKAGE2::TURTLESPEED")
  (make-package "PACKAGE2::TURTLESPEED"))

(in-package "ROS")
;;//! \htmlinclude TurtleSpeed.msg.html


(defclass package2::TurtleSpeed
  :super ros::object
  :slots (_linear_x _linear_y _angular ))

(defmethod package2::TurtleSpeed
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:linear_y __linear_y) 0.0)
    ((:angular __angular) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _linear_y (float __linear_y))
   (setq _angular (float __angular))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:linear_y
   (&optional __linear_y)
   (if __linear_y (setq _linear_y __linear_y)) _linear_y)
  (:angular
   (&optional __angular)
   (if __angular (setq _angular __angular)) _angular)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _linear_y
    8
    ;; float64 _angular
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _linear_x
       (sys::poke _linear_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _linear_y
       (sys::poke _linear_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _angular
       (sys::poke _angular (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linear_y
     (setq _linear_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _angular
     (setq _angular (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get package2::TurtleSpeed :md5sum-) "0a501a4dc2764ae9fc6458a7afe0f471")
(setf (get package2::TurtleSpeed :datatype-) "package2/TurtleSpeed")
(setf (get package2::TurtleSpeed :definition-)
      "float64 linear_x  #the x partition of linear speed
float64 linear_y  #the y partition of linear speed
float64 angular

")



(provide :package2/TurtleSpeed "0a501a4dc2764ae9fc6458a7afe0f471")


