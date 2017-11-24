FROM ubuntu:16.04

MAINTAINER Chuanjian Wang <me@ckeyer.com>

RUN apt-get update -y ;\
	apt-get install -y \
	  build-essential \
	  libtool \
	  autotools-dev \
	  automake \
	  pkg-config \
	  libssl-dev \
	  libevent-dev \
	  bsdmainutils \
	  python3 \
	  libboost-all-dev \
	  libminiupnpc-dev \
	  libzmq3-dev \
	  software-properties-common ;

RUN	add-apt-repository -y ppa:bitcoin/bitcoin ;\
	apt-get update -y ;\
	apt-get install -y libdb4.8-dev libdb4.8++-dev ;
