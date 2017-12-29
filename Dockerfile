FROM centos:7

MAINTAINER Chuanjian Wang <chuanjian@staff.sina.com.cn>

RUN yum update -y ;\
	yum install -y make autoconf automake autogen libtool gcc gcc-c++ snappy zlib bzip2 vim git unzip wget yum-utils ;\
	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo ;\
    yum-config-manager --enable docker-ce-edge ;\
    yum install -y docker-ce kubernetes-client;\
	yum clean all 

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

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/opt/gopath
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz && \
	tar zxf go1.9.2.linux-amd64.tar.gz && \
	rm -f go1.9.2.linux-amd64.tar.gz

RUN go get -u github.com/golang/protobuf/{proto,protoc-gen-go,protoc-gen-go} ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway ;\
	go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger ;\
	go get -u github.com/gogo/protobuf/protoc-gen-go{fast,gofast,gofaster,goslick} ;\
	go get google.golang.org/grpc ;\
	go get golang.org/x/crypto ;\
	go get golang.org/x/net ;\
	go get golang.org/x/sys ;\
	go get golang.org/x/text ;\
	go get golang.org/x/time ;\
	go get github.com/sirupsen/logrus ;\
	go get github.com/google/gofuzz ;\
	go get gopkg.in/mgo.v2 ;\
	go get gopkg.in/redis.v4 ;\
	mkdir -p $GOPATH/src/k8s.io ;\
	cd $GOPATH/src/k8s.io ;\
	git clone https://github.com/kubernetes/kubernetes.git -b release-1.9 ;\
	git clone https://github.com/kubernetes/utils.git -b master ;\
	git clone https://github.com/kubernetes/kube-openapi.git -b master ;\
	rm -rf $(find $GOPATH/src -type d -name .git) ;\
	rm -rf kubernetes/vendor/k8s.io ;\
	rm -rf $(find . -type d |grep "github.com/golang/glog") ;\
	for f in `ls $GOPATH/src/k8s.io/kubernetes/staging/src/k8s.io/`; do ln -s $GOPATH/src/k8s.io/kubernetes/staging/src/k8s.io/$f $f; done ;\
	for f in `ls $GOPATH/src/k8s.io/kubernetes/staging/src/k8s.io/`; do ln -s $GOPATH/src/k8s.io/kubernetes/vendor $f/vendor; done ;\
	for f in go-openapi emicklei mailru PuerkitoBio;do googleapis ghodss gregjones json-iterator juju peterbourgon spf13 mv $GOPATH/src/k8s.io/kubernetes/vendor/github.com/$f $GOPATH/src/github.com/ ;done ;\
	mv $GOPATH/src/k8s.io/kubernetes/vendor/github.com/google/btree $GOPATH/src/github.com/google/ ;\
	exit 0

ENTRYPOINT ["sh", "-c", "dockerd > /dev/zero & bash"]