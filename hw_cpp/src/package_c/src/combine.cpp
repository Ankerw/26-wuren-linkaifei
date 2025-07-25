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
    ros::NodeHandle nh;//初始化节点

    ros::Publisher pub = nh.advertise<sensor_msgs::PointCloud2>("/lidar_points", 10);
    //创建发布器，设置topic

    rosbag::Bag bag;
    bag.open("../bag/carla_test.bag",rosbag::bagmode::Read);

    rosbag::View view(bag,rosbag::TopicQuery({"/carla/ego_vehicle/lidar_up","/carla/ego_vehicle/lidar_mid","/carla/ego_vehicle/lidar_down"}));
    //读取三个话题

    pcl::PointCloud<pcl::PointXYZI>::Ptr target_cloud(new pcl::PointCloud<pcl::PointXYZI>);//先声明，pcl版的目标点云

//act
    for(const rosbag::MessageInstance& msg_inst : view)
    {
        sensor_msgs::PointCloud2::ConstPtr ptr
        = msg_inst.instantiate<sensor_msgs::PointCloud2>();//ptr指向点云消息

        pcl::PointCloud<pcl::PointXYZI>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZI>);//声明中间量
        pcl::fromROSMsg(*ptr, *temp_cloud);//转成pcl下

        
        for(auto& i:temp_cloud->points)
        {
            i.intensity = i.intensity * 256; //看了一下强度，大多在0.9到1之间，我都乘了256
            target_cloud->points.push_back(i);//依次往target添加点
        }

    



    }



    bag.close();//关闭




    sensor_msgs::PointCloud2 final_msg;
    pcl::toROSMsg(*target_cloud, final_msg); //转回来，转成 sensor_msgs::PointCloud2
    final_msg.header.frame_id = "lidar";  //唯一指定frame_id
    final_msg.header.stamp = ros::Time::now();//时间戳
  

    ros::Rate pub_rate(0.05); 
    
  



    while (ros::ok()) {
    pub.publish(final_msg);
    pub_rate.sleep();
    ros::spinOnce();
    } //设置频率，发布final_msg
  

}
