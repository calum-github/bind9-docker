# Dockerfile for BIND9

FROM debian:wheezy

MAINTAINER Calum Hunter <calum.h@gmail.com>

# Set Environmental variables
ENV DEBIAN_FRONTEND noninteractive

# Install required packages, then do a clean up
RUN apt-get update && \
	apt-get -y install \
	bind9 \
	bind9utils \
	dnsutils \
	curl \
	nano && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /etc/bind/*

# Setup directories for bind
RUN mkdir -p /etc/bind/zones/hint && \
	mkdir -p /etc/bind/zones/master
	mkdir -p /var/log/bind && chmod 777 /var/log/bind

# Add our startup script
ADD start.sh /start.sh

# Expose the bind folder as a volumes
VOLUME /etc/bind

# Expose the DNS port
EXPOSE 53

# Run our startup script
CMD ["/start.sh"]


