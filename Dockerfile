FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

ENV GOPATH=/opt/gopath
ENV PATH=$PATH:$GOPATH/bin

RUN apk add --update bash make go git
RUN go get -v -u github.com/whyrusleeping/gx ;\
	go get -v -u github.com/whyrusleeping/gx-go
