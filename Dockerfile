FROM centos:7

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN yum update -y ;\
	yum install -y make unzip wget vim rpm-build rpmdevtools;\
	yum clean all 
