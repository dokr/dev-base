FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm && \
	npm update && npm install -gf webpack vue-cli vue express 

WORKDIR /opt 
