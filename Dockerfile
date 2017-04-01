FROM node

MAINTAINER Chuanjian Wang <me@ckeyer.com>

WORKDIR /opt 

RUN npm update && npm install -g webpack vue-cli 


