#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>

#include <sensor_msgs/PointCloud2.h>

#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/common/common.h>
#include <pcl_conversions/pcl_conversions.h>

#include <iostream>

int main(int argc,char* argv[])
{
    ros::init(argc,argv,"combine");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<sensor_msgs::PointCloud2>("/lidar_points", 10);


    rosbag::Bag bag;
    bag.open("../bag/carla_test.bag",rosbag::bagmode::Read);

    rosbag::View view(bag,rosbag::TopicQuery({"/carla/ego_vehicle/lidar_up","/carla/ego_vehicle/lidar_mid","/carla/ego_vehicle/lidar_down"}));

    pcl::PointCloud<pcl::PointXYZI>::Ptr target_cloud(new pcl::PointCloud<pcl::PointXYZI>);

//act
    for(const rosbag::MessageInstance& msg_inst : view)
    {
        sensor_msgs::PointCloud2::ConstPtr ptr
        = msg_inst.instantiate<sensor_msgs::PointCloud2>();

        pcl::PointCloud<pcl::PointXYZI>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZI>);
        pcl::fromROSMsg(*ptr, *temp_cloud);

        
        for(auto& i:temp_cloud->points)
        {
            i.intensity = i.intensity * 256;
            target_cloud->points.push_back(i);
        }

    



    }



    bag.close();




    sensor_msgs::PointCloud2 final_msg;
    pcl::toROSMsg(*target_cloud, final_msg);
    final_msg.header.frame_id = "lidar";
    final_msg.header.stamp = ros::Time::now();
  

    ros::Rate pub_rate(0.05); 
  



    while (ros::ok()) {
    pub.publish(final_msg);
    pub_rate.sleep();
    ros::spinOnce();
    }
  

}
