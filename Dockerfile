FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update python3 python3-dev gcc g++ bash make curl ;\
	curl https://bootstrap.pypa.io/get-pip.py | python3
