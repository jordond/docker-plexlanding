FROM node:6.2-wheezy
MAINTAINER jordond

RUN useradd -u 1000 -m -s /bin/false app

COPY start.sh /opt
RUN git clone -b master https://github.com/jordond/plexlanding /opt/app
RUN ln -s /opt/app/dist/data /data && chown -R app:app /opt/* /data

USER app
WORKDIR /opt/app
RUN npm install --unsafe-perm

EXPOSE 8000
VOLUME /data

RUN /opt/start.sh
