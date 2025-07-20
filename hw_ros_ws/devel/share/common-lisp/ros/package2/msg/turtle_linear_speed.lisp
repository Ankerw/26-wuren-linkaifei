; Auto-generated. Do not edit!


(cl:in-package package2-msg)


;//! \htmlinclude turtle_linear_speed.msg.html

(cl:defclass <turtle_linear_speed> (roslisp-msg-protocol:ros-message)
  ((linear_x
    :reader linear_x
    :initarg :linear_x
    :type cl:float
    :initform 0.0)
   (linear_y
    :reader linear_y
    :initarg :linear_y
    :type cl:float
    :initform 0.0))
)

(cl:defclass turtle_linear_speed (<turtle_linear_speed>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <turtle_linear_speed>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'turtle_linear_speed)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name package2-msg:<turtle_linear_speed> is deprecated: use package2-msg:turtle_linear_speed instead.")))

(cl:ensure-generic-function 'linear_x-val :lambda-list '(m))
(cl:defmethod linear_x-val ((m <turtle_linear_speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package2-msg:linear_x-val is deprecated.  Use package2-msg:linear_x instead.")
  (linear_x m))

(cl:ensure-generic-function 'linear_y-val :lambda-list '(m))
(cl:defmethod linear_y-val ((m <turtle_linear_speed>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader package2-msg:linear_y-val is deprecated.  Use package2-msg:linear_y instead.")
  (linear_y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <turtle_linear_speed>) ostream)
  "Serializes a message object of type '<turtle_linear_speed>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'linear_y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <turtle_linear_speed>) istream)
  "Deserializes a message object of type '<turtle_linear_speed>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'linear_y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<turtle_linear_speed>)))
  "Returns string type for a message object of type '<turtle_linear_speed>"
  "package2/turtle_linear_speed")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'turtle_linear_speed)))
  "Returns string type for a message object of type 'turtle_linear_speed"
  "package2/turtle_linear_speed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<turtle_linear_speed>)))
  "Returns md5sum for a message object of type '<turtle_linear_speed>"
  "e20d908e89bc2f6fddbbddd1406770d0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'turtle_linear_speed)))
  "Returns md5sum for a message object of type 'turtle_linear_speed"
  "e20d908e89bc2f6fddbbddd1406770d0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<turtle_linear_speed>)))
  "Returns full string definition for message of type '<turtle_linear_speed>"
  (cl:format cl:nil "float64 linear_x #the x partition of linear_speed~%float64 linear_y #the y partition of linear_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'turtle_linear_speed)))
  "Returns full string definition for message of type 'turtle_linear_speed"
  (cl:format cl:nil "float64 linear_x #the x partition of linear_speed~%float64 linear_y #the y partition of linear_speed~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <turtle_linear_speed>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <turtle_linear_speed>))
  "Converts a ROS message object to a list"
  (cl:list 'turtle_linear_speed
    (cl:cons ':linear_x (linear_x msg))
    (cl:cons ':linear_y (linear_y msg))
))
