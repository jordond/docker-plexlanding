FROM node:6.2-wheezy
MAINTAINER jordond

RUN useradd -u 1000 -m -s /bin/false app

COPY start.sh /opt
RUN git clone -b master https://github.com/jordond/plexlanding /opt/app
RUN mkdir /data && \
  chmod +x /opt/start.sh && \
  chown -R app:app /opt/* /data

USER app
WORKDIR /opt/app
RUN npm install --silent --unsafe-perm

EXPOSE 8000

ENV DATA_DIR=/data
VOLUME /data

CMD /opt/start.sh
