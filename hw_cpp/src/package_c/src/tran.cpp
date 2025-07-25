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





Eigen::Matrix<double,2,1> transfer(const geometry_msgs::Point& pos)
{
    Eigen::Matrix<double,4,1> mat;
    mat << pos.x,pos.y,pos.z,1;

    Eigen::Matrix<double,3,1> cone_will_in_pixel = neican * waican * mat;
    Eigen::Matrix<double,2,1> cone_in_pixel;

    cone_in_pixel(0,0) = cone_will_in_pixel(0,0) /cone_will_in_pixel(2,0);
    cone_in_pixel(1,0) = cone_will_in_pixel(1,0) /cone_will_in_pixel(2,0);

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


    ros::init(argc,argv,"tran");
    ros::NodeHandle nh;

    image_transport::ImageTransport it(nh);
    image_transport::Publisher pub = it.advertise("/projected_image", 10);


    rosbag::Bag bag;
    bag.open("../bag/cone_detected.bag",rosbag::bagmode::Read);

    rosbag::View view(bag,rosbag::TopicQuery("/perception/fusion/cone_fusion"));
    //rosbag::View view(bag,rosbag::TopicQuery("/perception/lidar/cone_detections"));


    cv::Mat img(360,1280,CV_8UC3,cv::Scalar(255,255,255));
    std::vector<cv::Point2f> points;


    for(const rosbag::MessageInstance& msg_inst : view)
    {
        fsd_common_msgs::ConeDetections::ConstPtr cone_array_ptr
        = msg_inst.instantiate<fsd_common_msgs::ConeDetections>();

        if(cone_array_ptr != nullptr)
        {


            for(const auto& cone : cone_array_ptr->cone_detections){
                {
                    Eigen::Matrix<double,2,1> cone_in_pixel = transfer(cone.position);
                    
                    if(cone.color.data=="b")
                    {
                      cv::circle(img, cv::Point(cone_in_pixel(0,0), cone_in_pixel(1,0)), 5, cv::Scalar(0,0,255), -1);
                    }


                    else
                    {cv::circle(img, cv::Point(cone_in_pixel(0,0), cone_in_pixel(1,0)), 5, cv::Scalar(255,0,0), -1);}
                      points.emplace_back(cone_in_pixel[0], cone_in_pixel[1]);
                }


            }
                
        }





    }




    bag.close();


    sensor_msgs::ImagePtr msg = cv_bridge::CvImage(
    std_msgs::Header(), "bgr8", img).toImageMsg();
    msg->header.stamp = ros::Time::now();


    ros::Rate pub_rate(5);  
    while (ros::ok()) {
   
    pub.publish(msg);
    pub_rate.sleep();
    ros::spinOnce();
    }

     
    return 0;


}

