#! /usr/bin/env python3
#include <Eigen>

import rosbag
from geometry_msgs.msg import Point


bag = rosbag.Bag('../bag/cone_detected.bag', 'r')


for _,msg,_ in bag.read_messages('/perception/fusion/cone_fusion'):
    for i in msg.cone_detections:
        print(i.position)


       


