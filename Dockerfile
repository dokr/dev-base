FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm && \
	npm update && npm install -g webpack vue-cli 

WORKDIR /opt 
