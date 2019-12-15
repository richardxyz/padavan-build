FROM ubuntu:xenial

MAINTAINER Richard Xie

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL en_US.UTF-8

RUN apt-get update \
	&& apt-get install -qy apt-utils \
	&& apt-get -qy install locales \
	&& locale-gen --no-purge en_US.UTF-8 \
	&& apt-get install -qy \
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
	python-docutils \	
	sudo \
	module-init-tools \
	wget \
	bsdtar \
	&& mkdir -p /home/rt-n56u/toolchain-mipsel \
	&& git clone  --depth=1 https://bitbucket.org/padavan/rt-n56u.git /opt/rt-n56u \
	&& cd /opt/rt-n56u/toolchain-mipsel \
	&& ./clean_sources \
	&& ./build_toolchain_3.4.x \
	&& mv toolchain-3.4.x /home/rt-n56u/toolchain-mipsel/ \
	&& cd /opt && rm -rf /opt/rt-n56u
	
WORKDIR /opt

CMD ["/bin/bash"]