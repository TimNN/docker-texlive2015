FROM ubuntu:wily
MAINTAINER Tim Neumann <mail@timnn.me>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update \
 && apt-get -y upgrade \
 && apt-get -y install \
        software-properties-common \
 && apt-add-repository -y ppa:fkrull/deadsnakes \
 && apt-get -y update \
 && apt-get -y install \
        git \
        graphviz \
        python3-pip \
        python3.5 \
        texlive-full \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

ENV ENGINE=lualatex

ENV PYTHONUNBUFFERED=1

VOLUME ["/data"]
WORKDIR /data

ADD lbuild /usr/local/bin/lbuild
