FROM dockerfile/ubuntu
MAINTAINER Sam Day <me@samcday.com.au>

RUN apt-get update

RUN apt-get install -y build-essential gcc python git libssl-dev curl

RUN mkdir -p /usr/src/node
RUN curl http://nodejs.org/dist/v0.11.10/node-v0.11.10.tar.gz | tar -C /usr/src/node --strip-components 1 -zxvf -
RUN cd /usr/src/node && ./configure && make && make install
