FROM ubuntu:18.04

MAINTAINER Chuanjian Wang <me@ckeyer.com>

env NPM_CONFIG_PREFIX=/.npm-global
env PATH=/.npm-global/bin:$PATH
ADD upx /usr/bin/upx

RUN apt-get update -y ;\
	apt-get install -y nodejs npm make wget
# 	apk add --update ca-certificates bash nodejs nodejs-npm git make which python wget;

RUN npm update && \
	npm i npm@latest -g && \
	npm install -g gitbook-cli
RUN mkdir -p /tmp/tt && \
	cd /tmp/tt && \
	gitbook init && \
	gitbook build && \
	rm -rf /tmp/tt

WORKDIR /opt
