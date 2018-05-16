FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk update && \
	apk add --update ca-certificates bash nodejs nodejs-npm ;\
	npm update ;\
	npm i npm@latest -g ;\
	npm install -g webpack vue-cli vue express 

WORKDIR /opt 
