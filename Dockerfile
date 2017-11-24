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
	  libboost-system-dev \
	  libboost-filesystem-dev \
	  libboost-chrono-dev \
	  libboost-program-options-dev \
	  libboost-test-dev \
	  libboost-thread-dev \
	  libboost-all-dev \
	  libminiupnpc-dev \
	  libzmq3-dev \
	  software-properties-common ;\
	add-apt-repository -y ppa:bitcoin/bitcoin ;\
	apt-get update -y ;\
	apt-get install libdb4.8-dev libdb4.8++-dev ;
