FROM centos:7

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN yum update -y ;\
	yum install -y make autoconf automake autogen libtool gcc gcc-c++ snappy zlib bzip2 vim git unzip wget;\
	yum clean all 

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/opt/gopath
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz && \
	tar zxf go1.7.linux-amd64.tar.gz && \
	rm -f go1.7.linux-amd64.tar.gz

RUN cd /tmp && \
	wget https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip && \
	cd /usr && \
	unzip /tmp/protoc-3.2.0-linux-x86_64.zip && \
	cd /tmp && \
	git clone https://github.com/google/protobuf && \
	cd protobuf && \
	./autogen.sh && \
	./configure && \
	make && \
	make check && \
	make install && \
	go get -u github.com/golang/protobuf/{proto,protoc-gen-go} && \
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway && \
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger && \
	go get -u github.com/golang/protobuf/protoc-gen-go && \
	go get -u github.com/ckeyer/go-bindata/... && \
	rm -rf /tmp/*
