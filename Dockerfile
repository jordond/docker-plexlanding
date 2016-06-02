FROM node:6.2-wheezy
MAINTAINER jordond

RUN echo "deb http://http.debian.net/debian wheezy-backports main" >/etc/apt/sources.list.d/wheezy-backports.list \
  && apt-get update -qq \
  && apt-get -t wheezy-backports install -y -qq git \
  && useradd -u 1000 -m -s /bin/false app

COPY init /
RUN git clone https://github.com/jordond/plexlanding -b master /opt/app \
  && mkdir /data \
  && chmod +x /init \
  && chown -R app:app /opt/* /init /data

USER app
WORKDIR /opt/app
RUN npm install --silent --unsafe-perm && npm run build

EXPOSE 8000

ENV NODE_DOCKER=true
ENV NODE_ENV=production
ENV PORT=8000
ENV DATA_DIR=/data
VOLUME /data

CMD /init
