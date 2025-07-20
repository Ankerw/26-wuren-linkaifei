#!/usr/bin/env python3
import rospy
from package2.msg import TurtleSpeed  #导入package2的自定义消息

def turtle_speed_publisher():
    rospy.init_node('turtle_speed_publisher')  #这边初始化一个结点,'turtle_speed_publisher'
    pub = rospy.Publisher('/turtle_speed', TurtleSpeed, queue_size=10) #发布话题turtle_speed,设定为自定义的信息类型，设置消息队列长度
    rate = rospy.Rate(10)  #设置每秒发布十次信息

    while not rospy.is_shutdown():   #circle
        speed_msg = TurtleSpeed()
        speed_msg.linear_x = 1.0
        speed_msg.linear_y = 1.0 
        pub.publish(speed_msg)  #创建消息实例，填入x，y速度并发出
        rospy.loginfo("Published: linear_x=%.1f, linear_y=%.1f, angular=%.1f", 
                      speed_msg.linear_x, speed_msg.linear_y, speed_msg.angular)
        rate.sleep()

if __name__ == '__main__':
    try:
        turtle_publisher()
    except rospy.ROSInterruptException:
        pass
