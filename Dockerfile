FROM docker.io/centos:7
 
RUN yum install -y unzip &&\
    yum update -y 
