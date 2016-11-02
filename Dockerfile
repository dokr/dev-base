FROM centos:7

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN yum update -y ;\
	yum install -y make gcc gcc-c++ snappy snappy-devel zlib zlib-devel bzip2 bzip2-devel vim git unzip wget;\
	yum clean all 

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/opt/gopath
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz && \
	tar zxf go1.7.linux-amd64.tar.gz && \
	rm -f go1.7.linux-amd64.tar.gz

### Install RocksDB
RUN cd /tmp && \
	wget https://github.com/facebook/rocksdb/archive/v4.11.2.tar.gz && \
	tar zxf v4.11.2.tar.gz && \
	rm -f v4.11.2.tar.gz && \
	cd rocksdb-4.11.2 && \
	PORTABLE=1 make shared_lib && \
	INSTALL_PATH=/usr/local make install-shared && \
	ldconfig && \
	ln -s /usr/local/lib/librocksdb.so.4.11.2 /lib64/librocksdb.so.4.11 && \
	rm -rf /tmp/*

# Install node environment.
RUN cd /tmp && \
	wget https://nodejs.org/dist/v7.0.0/node-v7.0.0-linux-x64.tar.xz && \
	tar xvJf node-v7.0.0-linux-x64.tar.xz.xz && \
	rm -f node-v7.0.0-linux-x64/*.md && \
	rm -f node-v7.0.0-linux-x64/LICENSE && \
	cp -a node-v7.0.0-linux-x64/* /usr/local && \
	rm -rf /tmp/*
RUN npm install -g webpack vue-cli
