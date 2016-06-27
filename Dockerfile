FROM ckeyer/dev

MAINTAINER ckeyer <docker@ckeyer.com>

RUN apk add --update etcd && \
	rm -rf /var/cache/apk/*

