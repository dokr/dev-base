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
	wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz && \
	tar zxf go1.9.2.linux-amd64.tar.gz && \
	rm -f go1.9.2.linux-amd64.tar.gz

# Install protobuf
RUN cd /tmp && \
	git clone https://github.com/google/protobuf && \
	cd protobuf && \
	./autogen.sh && \
	./configure && \
	make && \
	make check && \
	make install && \
	rm -rf /tmp/*

RUN cd /tmp && \
	wget https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip && \
	cd /usr && \
	unzip /tmp/protoc-3.2.0-linux-x86_64.zip && \
	rm -rf /tmp/*

RUN go get -u github.com/golang/protobuf/{proto,protoc-gen-go,protoc-gen-go} ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger ;\
	go get -u github.com/gogo/protobuf/protoc-gen-go{fast,gofast,gofaster,goslick} ;\
	go get -u github.com/ckeyer/go-bindata/... ;\
	go get google.golang.org/grpc ;\
	go get golang.org/x/crypto ;\
	go get golang.org/x/image ;\
	go get golang.org/x/net ;\
	go get golang.org/x/oauth2 ;\
	go get golang.org/x/sys ;\
	go get golang.org/x/text ;\
	go get golang.org/x/time ;\
	rm -rf /opt/gopath/src/github ;\
	rm -rf $(find /opt/gopath/src -type d -name .git) ;\
	exit 0
