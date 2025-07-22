#!/usr/bin/env python3
import rosbag
from fsd_common_msgs.msg import ConeDetections

bag = rosbag.Bag('../bag/lidar_cone_side_&_slam_state.bag','r')
topic = '/perception/lidar/cone_side' 


color_counts = {'b': 0, 'r': 0}
processed_cones = set()

for _, msg, _ in bag.read_messages(topics=[topic]):
    for i in msg.cone_detections:
        now_position = (i.position.x, i.position.y)
        if now_position in processed_cones:
            continue
        if i.poseConfidence.data < 0.9:
            continue

        processed_cones.add(now_position)
        now_value = i.color.data
        if now_value =='b':
            color_counts['b'] +=1
        elif now_value=='r':
            color_counts['r'] +=1

print(f"the number of blue cones: {color_counts['b']}" )
print(f"the number of red cones: {color_counts['r']}")

