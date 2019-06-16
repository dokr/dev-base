FROM ckeyer/dev:go

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN cd /tmp && \
	wget https://github.com/google/protobuf/releases/download/v3.8.0/protoc-3.8.0-linux-x86_64.zip && \
	cd /usr/local/ && \
	unzip /tmp/protoc-3.8.0-linux-x86_64.zip && \
	rm -rf /tmp/*

RUN mkdir -p $GOPATH/src/google.golang.org ;\
	mkdir -p $GOPATH/src/github.com/gogo ;\
	git clone https://github.com/grpc/grpc-go.git -b v1.21.x $GOPATH/src/google.golang.org/grpc ;\
	git clone https://github.com/gogo/protobuf.git $GOPATH/src/github.com/gogo/protobuf ;\
	cd $GOPATH/src/github.com/gogo/protobuf ;\
	git checkout v1.0.0 ;\
	go get github.com/sirupsen/logrus ;\
	go get github.com/google/gofuzz ;\
	go get github.com/emicklei/go-restful ;\
	go get github.com/go-openapi/spec ;\
	go get github.com/golang/protobuf ;\
	go get github.com/gogo/protobuf ;\
	go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-{grpc-gateway,swagger} ;\
	go get github.com/grpc-ecosystem/go-grpc-middleware ;\
	go get github.com/golang/protobuf/{proto,protoc-gen-go} ;\
	go get github.com/gogo/protobuf/protoc-gen-go{fast,gofast,gofaster,goslick} ;\
	go get github.com/infobloxopen/protoc-gen-gorm ;\
	go get github.com/jinzhu/gorm ;\
	go get github.com/infobloxopen/atlas-app-toolkit/gorm
