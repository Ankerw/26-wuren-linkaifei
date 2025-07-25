#include <ros/ros.h>
#include <rosbag/bag.h>
#include <rosbag/view.h>
#include <geometry_msgs/Point.h>


#include <fsd_common_msgs/ConeDetections.h>
#include <fsd_common_msgs/Cone.h>

#include <Eigen/Dense>
#include<opencv2/opencv.hpp>

#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <image_transport/image_transport.h>



Eigen::Matrix<double,3,4> waican;
Eigen::Matrix<double,3,3> neican;
//外参和内参矩阵，最开始忘了要在函数内赋值，只剩下了声明，赋值放到了main里





Eigen::Matrix<double,2,1> transfer(const geometry_msgs::Point& pos) //用来接受单个锥桶消息里的Point，输出2×1的vector
{   
    Eigen::Matrix<double,4,1> mat;
    mat << pos.x,pos.y,pos.z,1;     //要用4×1的列向量表示原来坐标，补一个1

    Eigen::Matrix<double,3,1> cone_will_in_pixel = neican * waican * mat;  //依次乘外参和内参
    Eigen::Matrix<double,2,1> cone_in_pixel;

    cone_in_pixel(0,0) = cone_will_in_pixel(0,0) /cone_will_in_pixel(2,0);
    cone_in_pixel(1,0) = cone_will_in_pixel(1,0) /cone_will_in_pixel(2,0); //把（x，y，z）里的z化为1，投到像素平面上

    return cone_in_pixel;
}


int main(int argc,char* argv[])
{   

    waican<<3.5594209875121074e-03, -9.9987761481865733e-01,
-1.5234365979146680e-02, 8.9277270417879417e-02,
  1.9781062410225703e-03, 1.5241472820252011e-02,
-9.9988188532544631e-01, 9.1100499695349946e-01,
  9.9999170877459420e-01, 3.5288653732390984e-03,
  2.0321149683686368e-03, 1.9154049062915668e+00;


  neican<<532.795, 0.0, 632.15,
  0.0, 532.72, -3.428,
  0.0, 0.0, 1.0;
//赋值，两个参数矩阵

    ros::init(argc,argv,"tran");
    ros::NodeHandle nh;
//初始化node

    image_transport::ImageTransport it(nh);
    image_transport::Publisher pub = it.advertise("/projected_image", 10);
//要发布可视化结果，用image_transport库创建图像发布器

    rosbag::Bag bag;
    bag.open("../bag/cone_detected.bag",rosbag::bagmode::Read);
    rosbag::View view(bag,rosbag::TopicQuery("/perception/fusion/cone_fusion"));
    //rosbag::View view(bag,rosbag::TopicQuery("/perception/lidar/cone_detections"));
//读取包里的消息，ppt里的好像有误，用rosbag info得到另一个消息类型

    cv::Mat img(360,1280,CV_8UC3,cv::Scalar(255,255,255));
    std::vector<cv::Point2f> points;
//背景，放像素点的可变数组

    for(const rosbag::MessageInstance& msg_inst : view)  //新学到的用法for（单个成员：容器），
    {
        fsd_common_msgs::ConeDetections::ConstPtr cone_array_ptr
        = msg_inst.instantiate<fsd_common_msgs::ConeDetections>();

        if(cone_array_ptr != nullptr)
        {


            for(const auto& cone : cone_array_ptr->cone_detections){  //cone_array_ptr访问ConeDetections里的cone_detections，这是一个cone数组
                {
                    Eigen::Matrix<double,2,1> cone_in_pixel = transfer(cone.position);//调用函数转化
                    
                    if(cone.color.data=="b")
                    {
                      cv::circle(img, cv::Point(cone_in_pixel(0,0), cone_in_pixel(1,0)), 5, cv::Scalar(0,0,255), -1);
                    }


                    else
                    {cv::circle(img, cv::Point(cone_in_pixel(0,0), cone_in_pixel(1,0)), 5, cv::Scalar(255,0,0), -1);}
                      points.emplace_back(cone_in_pixel[0], cone_in_pixel[1]);
                      //我在后面补上了颜色识别，用rviz可视化过bag里的Makerarray，看到只有红蓝两种色
                }


            }
                
        }





    }




    bag.close();
    //关闭


    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(std_msgs::Header(), "bgr8", img).toImageMsg(); 
    //套用ppt里的模板创建msg

    msg->header.stamp = ros::Time::now();  //时间戳


    ros::Rate pub_rate(5);  
    while (ros::ok()) {
   
    pub.publish(msg);
    pub_rate.sleep();
    ros::spinOnce();
    } //以设定频率持续发布msg

     
    return 0;


}

