FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update go vim wget make bash bash-completion gcc g++

ONBUILD ENV GOROOT_BOOTSTRAP=/usr/lib/go
ONBUILD ENV GOROOT=/usr/local/go
ONBUILD COPY . /usr/local/go/
ONBUILD RUN cd /usr/local/go/src && ./make.bash