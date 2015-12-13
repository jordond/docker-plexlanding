FROM node:4.2.3-wheezy
MAINTAINER jordond

RUN apt-get update && apt-get install -y \
  curl \
  git \
  wget

RUN rm -rf /var/lib/apt/lists/*

RUN useradd -u 1000 -m -s /bin/bash user

RUN npm install -g gulp webpack

USER user

VOLUME /config

EXPOSE 8777

# Eventually use a pre-build release instead of building it manually

ADD build.sh /opt
RUN chmod +x /opt/build.sh && /opt/build.sh

# Start the application
RUN node /opt/plexlanding/server \
  --data-dir=/config \
  --config=/config/config.json
