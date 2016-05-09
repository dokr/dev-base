FROM alpine:edge

MAINTAINER ckeyer <docker@ckeyer.com>

RUN apk add --update git make subversion curl wget tar zip bash bash-completion && \
	rm -rf /var/cache/apk/*

