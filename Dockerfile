FROM ubuntu:xenial

MAINTAINER Richard Xie

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -qy apt-utils
RUN apt-get -qy install locales
RUN locale-gen --no-purge en_US.UTF-8
ENV LC_ALL en_US.UTF-8


RUN apt-get install -qy \
	git \
	build-essential \
	gawk \
	pkg-config \
	gettext \
	automake \
	autoconf \
	autopoint \
	libtool \
	bison \
	flex \
	zlib1g-dev \
	libgmp3-dev \
	libmpfr-dev \
	libmpc-dev \
	texinfo \
	mc \
	libncurses5-dev \
	nano \
	vim \
  	autopoint \
	gperf \
	python-docutils
	
RUN apt-get install -qy \	
	sudo \
	module-init-tools \
	wget \
	bsdtar

	
RUN mkdir -p /home/rt-n56u/toolchain-mipsel

RUN git clone  --depth=1 https://bitbucket.org/padavan/rt-n56u.git /opt/rt-n56u

RUN cd /opt/rt-n56u/toolchain-mipsel && ./clean_sources && ./build_toolchain_3.4.x && mv toolchain-3.4.x /home/rt-n56u/toolchain-mipsel/ 

RUN cd /opt && rm -rf /opt/rt-n56u

CMD ["/bin/bash"]