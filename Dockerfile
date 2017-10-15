FROM centos:7

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN yum update -y && yum install -y make gcc python python-devel

RUN curl https://bootstrap.pypa.io/get-pip.py | python ;\
	pip --no-cache-dir install ipykernel jupyter numpy scipy sklearn pandas matplotlib ;\
	python -m ipykernel.kernelspec

ENV TF_VERSION=1.3.0

RUN pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-$TF_VERSION-cp27-none-linux_x86_64.whl
