FROM ckeyer/dev

MAINTAINER ckeyer <docker@ckeyer.com>

RUN apk add --update etcd --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing  && \
	rm -rf /var/cache/apk/*

