FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update ca-certificates bash python g++ musl make
RUN apk add --update nodejs nodejs-npm
RUN npm i -g npm@latest ;\
	npm install -g webpack vue-cli vue express npm-check-updates node-sass

WORKDIR /opt 
