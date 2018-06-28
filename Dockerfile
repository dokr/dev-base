FROM ubuntu:18.04

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apt-get update -y ;\
	apt-get install -y python3 python3-pip python3-dev python-virtualenv

RUN virtualenv --system-site-packages -p python3 ~/tensorflow ;\
	source ~/tensorflow/bin/activate ;\
	pip3 install --upgrade tensorflow 
