FROM ubuntu:latest

MAINTAINER Joseph Callen <jcpowermac@gmail.com>


RUN apt-get -y update \
    && apt-get -y install git make build-essential wget \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists/*

RUN git clone git://git.ipxe.org/ipxe.git /home/ipxe
WORKDIR /home/ipxe
RUN ls -l
RUN wget -q https://gist.githubusercontent.com/jcpowermac/7cc13ce51816ce5222f4/raw/4384911a921a732e0b85d28ff3485fe18c092ffd/image_comboot.patch && patch -p1 < image_comboot.patch
WORKDIR /home/ipxe/src
CMD make
