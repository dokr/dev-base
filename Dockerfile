FROM centos:7

MAINTAINER Chuanjian Wang <me@ckeyer.com>

ENV TZ=Asia/Shanghai
RUN yum update -y ;\
	yum install -y wget git make bash-completion gcc unzip which;

### Install Golang
ENV GOROOT=/usr/local/go
ENV GOPATH=/go
ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin
ENV GOCACHE=/go-cache
WORKDIR /go/src

RUN cd /usr/local && \
	wget https://storage.googleapis.com/golang/go1.10.linux-amd64.tar.gz && \
	tar zxf go1.10.linux-amd64.tar.gz && \
	rm -f go1.10.linux-amd64.tar.gz

RUN go get golang.org/x/crypto ;\
	go get golang.org/x/image ;\
	go get golang.org/x/net ;\
	go get golang.org/x/oauth2 ;\
	go get golang.org/x/sys ;\
	go get golang.org/x/text ;\
	go get golang.org/x/time ;\
	go get golang.org/x/lint/golint ;\
	go get github.com/swaggo/swag/cmd/swag ;\
	go get github.com/jteeuwen/go-bindata/go-bindata
