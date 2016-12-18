FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update make vim bash git nodejs

RUN npm install -g webpack vue-cli karma bower grunt-cli graceful-fs@4.1.5 minimatch@3.0.2 grunt grunt-auto-install grunt-contrib-uglify grunt-contrib-copy

WORKDIR /opt 
