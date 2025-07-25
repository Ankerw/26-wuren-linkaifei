#!/usr/bin/env python3
import rosbag
from fsd_common_msgs.msg import ConeDetections

bag = rosbag.Bag('../bag/lidar_cone_side_&_slam_state.bag','r')
topic = '/perception/lidar/cone_side' 


color_counts = {'b': 0, 'r': 0}
processed_cones = set()

for _, msg, _ in bag.read_messages(topics=[topic]):  #这边要读取一下我们的这个bag，筛选topic
    for i in msg.cone_detections:    #消息里有一个数组，由一些cone.msg构成
        now_position = (i.position.x, i.position.y)
        if now_position in processed_cones:  #对这个位置筛选，不要重
            continue
        if i.poseConfidence.data < 0.9:  #对位置置信度筛选，0.9比较合适
            continue                        #color置信度全是0，不做筛选

        processed_cones.add(now_position)
        now_value = i.color.data
        if now_value =='b':
            color_counts['b'] +=1
        elif now_value=='r':
            color_counts['r'] +=1   #数一下

print(f"the number of blue cones: {color_counts['b']}" )
print(f"the number of red cones: {color_counts['r']}")  #显示
