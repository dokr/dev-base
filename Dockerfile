FROM node

MAINTAINER Chuanjian Wang <me@ckeyer.com>

WORKDIR /opt 

RUN npm install -g webpack vue-cli bower grunt-cli graceful-fs@4.1.5 minimatch@3.0.2 grunt grunt-auto-install grunt-contrib-uglify grunt-contrib-copy


