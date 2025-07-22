#!/usr/bin/env python3
import rospy
import rosbag
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point
from std_msgs.msg import String
#导入Marker用于可视化， 导入point和string来提供锥桶信息
from fsd_common_msgs.msg import ConeDetections  
#ConeDetections是由Cone.msg构成，Cone.msg拥有point position和color string

def visualize_cone_from_bag(bag_path, topic):
    rospy.init_node('cone_rivz')
    #初始化节点，用来发布maker
    pub = rospy.Publisher('cone_marker', Marker, queue_size=10)

    bag = rosbag.Bag(bag_path,'r')
    
    marker_id = 0
    
    for _, msg, t in bag.read_messages(topics=[topic]):
                # 遍历 bag 中的消息
        for i in msg.cone_detections:
        # 创建 Marker
            marker = Marker()
            marker.header.stamp = t  #时间
            marker.header.frame_id = "map" #设置坐标系为map
            marker.ns = "cone"
            marker.id = marker_id 
            marker_id += 1
            marker.type = Marker.CYLINDER
            marker.action = Marker.ADD
            
            marker.lifetime = rospy.Duration() # 保持锥桶不消失

            marker.scale.x = 1  
            marker.scale.y = 1
            marker.scale.z = 2   # 设置尺寸

            marker.pose.position = i.position   # 设置位置
        
            marker.pose.orientation.w = 1.0
            color_data = i.color.data  # 设置颜色
            if color_data == 'r':
                marker.color.r = 1.0
                marker.color.g = 0.0
                marker.color.b = 0.0
                marker.color.a = 1.0
            elif color_data == 'b':
                marker.color.r = 0.0
                marker.color.g = 0.0
                marker.color.b = 1.0
                marker.color.a = 1.0  # 设置为不透明
                         
            pub.publish(marker) # 发布Marker到RViz
            rospy.sleep(0.1)  #yanchi

if __name__ == '__main__':
    bag_path = '../bag/lidar_cone_side_&_slam_state.bag' #相对路径，所以一定要在scripts里运行脚本
    topic = '/perception/lidar/cone_side'  #bag里面的对应话题
    visualize_cone_from_bag(bag_path, topic)  #调用函数
