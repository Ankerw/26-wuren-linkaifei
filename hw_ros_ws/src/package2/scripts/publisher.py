#!/usr/bin/env python3
import rospy
from package2.msg import turtle_linear_speed    #从 package2 里导入自定义消息

def publisher_node():
    rospy.init_node('turtle_linear_speed_publisher')
   #初始化 发布者结点
    pub = rospy.Publisher('turtle_linear_speed_topic', turtle_linear_speed, queue_size=10)  
    #发布turtle_linear_speed类型信息到turtle_linear_speed_topic话题
    rate = rospy.Rate(1)  #发布频率设置为1hz

    while not rospy.is_shutdown(): #设置循环
        msg = turtle_linear_speed()
        msg.linear_x = 0.5  #设置x方向线速度
        msg.linear_y = 0.5  #设置y方向线速度
        #创建消息

        pub.publish(msg)  #发布
        rospy.loginfo("Published: linear_x=%f, linear_y=%f", msg.linear_x, msg.linear_y)  #日志
        rate.sleep()

if __name__ == '__main__':
    try:
        publisher_node()
    except rospy.ROSInterruptException:
        pass
