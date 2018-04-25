FROM ckeyer/dev:go

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update unzip

RUN cd /tmp && \
	wget https://github.com/google/protobuf/releases/download/v3.5.1/protoc-3.5.1-linux-x86_64.zip && \
	cd /usr/local/ && \
	unzip /tmp/protoc-3.5.1-linux-x86_64.zip && \
	rm -rf /tmp/*

RUN mkdir -p $GOPATH/src/google.golang.org ;\
	git clone https://github.com/grpc/grpc-go.git -b v1.10.x $GOPATH/src/google.golang.org/grpc ;\
    go get -u github.com/golang/protobuf/{proto,protoc-gen-go,protoc-gen-go} ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger ;\
	go get -u github.com/gogo/protobuf/protoc-gen-go{fast,gofast,gofaster,goslick} ;\
	go get github.com/sirupsen/logrus ;\
	go get github.com/google/gofuzz ;\
	go get gopkg.in/mgo.v2 ;\
	go get gopkg.in/redis.v4 ;\
	go get github.com/emicklei/go-restful ;\
	go get github.com/go-openapi/spec ;\
	rm -rf $(find $GOPATH/src -type d -name .git)

# Install K8s Packages.
RUN mkdir -p $GOPATH/src/k8s.io ;\
	cd $GOPATH/src/k8s.io ;\
	git clone https://github.com/kubernetes/client-go.git -b release-6.0 ;\
	git clone https://github.com/kubernetes/apimachinery.git -b release-1.9 ;\
	git clone https://github.com/kubernetes/apiextensions-apiserver.git -b release-1.9 ;\
	git clone https://github.com/kubernetes/kube-openapi.git -b master ;\
	git clone https://github.com/kubernetes/apiserver.git -b release-1.9 ;\
	git clone https://github.com/kubernetes/kubernetes.git -b release-1.9 ;\
	git clone https://github.com/kubernetes/api.git -b release-1.9 ;\
	rm -rf kubernetes/vendor/k8s.io ;\
	rm -rf $(find . -type d |grep "github.com/golang/glog") ;\
	rm -rf $(find . -type d |grep "github.com/emicklei/go-restful") ;\
	rm -rf $(find . -type d |grep "github.com/go-openapi/spec") ;\
	cp -a kubernetes/vendor client-go/vendor ;\
	cp -a kubernetes/vendor apimachinery/vendor ;\
	cp -a kubernetes/vendor apiserver/vendor ;\
	rm -rf $(find $GOPATH/src -type d -name .git) ;\
	exit 0
