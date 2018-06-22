FROM ckeyer/dev:node

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN mkdir -p /usr/lib/node_modules/node-sass && \
	npm install -g node-sass

