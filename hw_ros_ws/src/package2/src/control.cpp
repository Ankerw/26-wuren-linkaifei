
#include "ros/ros.h"
#include "package2/turtle_linear_speed.h"
#include "geometry_msgs/Twist.h"//控制乌龟的消息

class TurtleController
{
    public:
    TurtleController() 
    {
        sub = nh.subscribe("turtle_linear_speed_topic", 10, &TurtleController::speedCallback, this);        //订阅话题
        pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);       //发布控制指令
    }

    private:
    ros::NodeHandle nh;  //句柄
    ros::Subscriber sub;  //订阅者
    ros::Publisher pub; //发布者

     void speedCallback(const package2::turtle_linear_speed::ConstPtr& msg)    //回调函数，订阅+读参+控制
     {
        geometry_msgs::Twist cmd_vel;
        double turtle_angular_speed;


        nh.getParam("speed/turtle_angular_speed", turtle_angular_speed);  //用getParam读取角速度

        cmd_vel.linear.x = msg->linear_x;
        cmd_vel.linear.y = msg->linear_y;
        cmd_vel.angular.z = turtle_angular_speed;
        //传入参数 x，y和角速度

        pub.publish(cmd_vel);
        ROS_INFO("Control: linear_x=%.2f, linear_y=%.2f, angular_z=%.2f", 
                 msg->linear_x, msg->linear_y, turtle_angular_speed); //发布控制指令
    } 
 
    


};




int main(int argc, char* argv[])
 {
    ros::init(argc, argv, "control");  //初始化控制结点

    TurtleController controller; //创建控制者对象

    ros::spin();
    return 0;
}
