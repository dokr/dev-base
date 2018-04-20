FROM centos:7

MAINTAINER Chuanjian Wang <chuanjian@staff.sina.com.cn>

RUN yum update -y ;\
	yum install -y make gcc vim git unzip wget ;\
	yum clean all 

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
ENV GOCACHE=/go-cache

RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.10.1.linux-amd64.tar.gz && \
	tar zxf go1.10.1.linux-amd64.tar.gz && \
	rm -f go1.10.1.linux-amd64.tar.gz

RUN cd /tmp && \
	wget https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip && \
	cd /usr && \
	unzip /tmp/protoc-3.2.0-linux-x86_64.zip && \
	rm -rf /tmp/*

RUN go get -u github.com/golang/protobuf/{proto,protoc-gen-go,protoc-gen-go} ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger ;\
	go get -u github.com/gogo/protobuf/protoc-gen-go{fast,gofast,gofaster,goslick} ;\
	go get golang.org/x/crypto ;\
	go get golang.org/x/net ;\
	go get golang.org/x/sys ;\
	go get golang.org/x/text ;\
	go get golang.org/x/time ;\
	go get github.com/sirupsen/logrus ;\
	go get github.com/google/gofuzz ;\
	go get gopkg.in/mgo.v2 ;\
	go get gopkg.in/redis.v4 ;\
	mkdir -p $GOPATH/src/google.golang.org ;\
	git clone https://github.com/grpc/grpc-go.git -b v1.10.x $GOPATH/src/google.golang.org/grpc ;\
	mkdir -p $GOPATH/src/k8s.io ;\
	cd $GOPATH/src/k8s.io ;\
	git clone https://github.com/kubernetes/client-go.git -b release-3.0 ;\
	git clone https://github.com/kubernetes/apimachinery.git -b release-1.6 ;\
	git clone https://github.com/kubernetes/apiserver.git -b release-1.6 ;\
	git clone https://github.com/kubernetes/kubernetes.git -b release-1.6 ;\
	rm -rf kubernetes/vendor/k8s.io ;\
	rm -rf $(find $GOPATH/src/k8s.io -type d |grep "github.com/golang/glog") ;\
	cp -a kubernetes/vendor client-go/vendor ;\
	cp -a kubernetes/vendor apimachinery/vendor ;\
	cp -a kubernetes/vendor apiserver/vendor ;\
	rm -rf $(find $GOPATH/src -type d -name .git) ;\
	exit 0
