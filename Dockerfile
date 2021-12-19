FROM ubuntu:20.04

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN pip3 install tensorflow numpy flask

# 只使用 CPU
ENV CUDA_DEVICE_ORDER=PCI_BUS_ID
ENV CUDA_VISIBLE_DEVICES=-1

EXPOSE 5000
