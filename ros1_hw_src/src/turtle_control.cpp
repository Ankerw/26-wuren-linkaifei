#include "ros/ros.h"
#include <package2/TurtleSpeed.h>
#include <geometry_msgs/Twist.h>

using namespace ros;
using namespace package2;


double angular_speed = 0.2; //initial the "angular_speed"

//回调函数
void callback(const package2 :: TurtleSpeed ::ConstPtr& msg){

ros::NodeHandle private_nh("~");
private_nh.param("speed/angular_speed", angular_speed, 0.2);


static ros::Publisher cmd_pub = private_nh.advertise<geometry_msgs::Twist>(
        "/turtle1/cmd_vel", 10);

 geometry_msgs::Twist cmd;
    cmd.linear.x = msg->linear_x;  // 线速度x分量
    cmd.linear.y = msg->linear_y;  // 线速度y分量
    cmd.angular.z = angular_speed; // 角速度
cmd_pub.publish(cmd);


}

int main(int argc, char *argv[])
{   

    //1.初始化 ROS 节点
    ros::init(argc,argv,"turtle_control_node");

    //2.创建 ROS 句柄
    ros::NodeHandle nh;

    //3.创建订阅对象
    ros::Subscriber sub = nh.subscribe< package2 :: TurtleSpeed >("/turtle_speed", 10, callback);

    //4.回调函数处理
    ros::spin();    

    return 0;
}

