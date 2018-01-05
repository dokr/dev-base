FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm git && \
	npm update && npm install -g @angular/cli 

WORKDIR /opt 
