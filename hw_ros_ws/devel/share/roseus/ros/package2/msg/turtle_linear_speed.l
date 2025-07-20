;; Auto-generated. Do not edit!


(when (boundp 'package2::turtle_linear_speed)
  (if (not (find-package "PACKAGE2"))
    (make-package "PACKAGE2"))
  (shadow 'turtle_linear_speed (find-package "PACKAGE2")))
(unless (find-package "PACKAGE2::TURTLE_LINEAR_SPEED")
  (make-package "PACKAGE2::TURTLE_LINEAR_SPEED"))

(in-package "ROS")
;;//! \htmlinclude turtle_linear_speed.msg.html


(defclass package2::turtle_linear_speed
  :super ros::object
  :slots (_linear_x _linear_y ))

(defmethod package2::turtle_linear_speed
  (:init
   (&key
    ((:linear_x __linear_x) 0.0)
    ((:linear_y __linear_y) 0.0)
    )
   (send-super :init)
   (setq _linear_x (float __linear_x))
   (setq _linear_y (float __linear_y))
   self)
  (:linear_x
   (&optional __linear_x)
   (if __linear_x (setq _linear_x __linear_x)) _linear_x)
  (:linear_y
   (&optional __linear_y)
   (if __linear_y (setq _linear_y __linear_y)) _linear_y)
  (:serialization-length
   ()
   (+
    ;; float64 _linear_x
    8
    ;; float64 _linear_y
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
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _linear_x
     (setq _linear_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _linear_y
     (setq _linear_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get package2::turtle_linear_speed :md5sum-) "e20d908e89bc2f6fddbbddd1406770d0")
(setf (get package2::turtle_linear_speed :datatype-) "package2/turtle_linear_speed")
(setf (get package2::turtle_linear_speed :definition-)
      "float64 linear_x #the x partition of linear_speed
float64 linear_y #the y partition of linear_speed

")



(provide :package2/turtle_linear_speed "e20d908e89bc2f6fddbbddd1406770d0")


