FROM dockerfile/ubuntu
MAINTAINER Sam Day <me@samcday.com.au>

ENV NODE_VERSION 0.11.10

# Install build dependencies.
RUN apt-get update
RUN apt-get install -y build-essential gcc python git libssl-dev curl

# Download Node source.
RUN mkdir -p /usr/src/node
RUN curl http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz | tar -C /usr/src/node --strip-components 1 -zxvf -

# Build and install Node. Default configure prefix means node + npm will be in
# PATH straight away.
RUN cd /usr/src/node && ./configure && make && make install

# Install node-gyp and run it to get the Node tarball it wants.
RUN npm install -g node-gyp && node-gyp install

ENTRYPOINT node
