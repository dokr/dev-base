FROM alpine:edge

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apk add --update make \
	 bash \
	 wget \
	 autoconf \
	 automake \
	 g++ \
	 gcc \
	 libgcc \
	 libstdc++ \
	 libtool \
	 libressl2.5-libcrypto \
	 openssl-dev \
	 libevent-dev \
	 boost-dev \
	 miniupnpc-dev \
	 protobuf-dev \
	 libqrencode-dev &&\
	apk add --update --update-cache --repository http://dl-4.alpinelinux.org/alpine/edge/testing libupnp-dev &&\
	cd /tmp ;\
	wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz ;\
	tar -xzf db-4.8.30.NC.tar.gz ;\
	cd db-4.8.30.NC/build_unix ;\
	../dist/configure --enable-cxx ;\
	make ;\
	make install ;\
	mv /usr/local/BerkeleyDB.4.8/lib/* /usr/lib/ ;\
	mv /usr/local/BerkeleyDB.4.8/bin/* /usr/bin/ ;\
	mv /usr/local/BerkeleyDB.4.8/include/* /usr/include/ ;\
	rm -rf /usr/local/BerkeleyDB.4.8 ;\
	rm -rf /tmp/*
