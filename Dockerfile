FROM ubuntu:18.04

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apt-get update -y ;\
	apt-get install -y \
	 build-essential \
	 software-properties-common \
	 cmake \
	 gfortran \
	 git \
	 wget \
	 curl \
	 pkg-config \
	 python3 \
	 python3-dev \
	 python3-pip \
	 python3-numpy \
	;\
	apt-get clean ;\
	rm -rf /tmp/* /var/tmp/*
