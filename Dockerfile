#FROM ubuntu:latest
FROM golang:latest
MAINTAINER bolli95 "maxlukasboll@gmail.com"

# first set the right working dir
WORKDIR /jsfscan

# copy all files to the container
COPY . .

# install all depedencies
RUN chmod +x ./install.sh
RUN apt-get -y update && apt-get -y install --no-install-recommends \
    git         \
    wget 	\
    python3 	\
    python3-pip \
    python3-setuptools \
    python3-wheel \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /usr/share/doc && rm -rf /usr/share/man \
    && apt-get clean
RUN ./install.sh
ENV HOME /root
ENV GOPATH=$HOME/go/bin
ENV PATH $PATH:$GOPATH  
