FROM node:8.3.0-alpine MAINTAINER Alaura Fantasiannightmare@gmail.com

ENV DAEMON_VERSION=v0.6.12

WORKDIR /srv/daemon

RUN apk update && apk add
coreutils curl openssl make gcc g++ python gnupg tar
&& curl -L https://github.com/pterodactyl/daemon/releases/download/v0.6.12/daemon.tar.gz
&& tar --strip-components=1 -xzvf ${DAEMON_VERSION}.tar.gz
&& npm install --production
&& apk del curl make gcc g++ python gnupg
&& rm -rf /root/.npm /root/.node-gyp /root/.gnupg /var/cache/apk/* /tmp/*

EXPOSE 8080

CMD [ "npm", "start" ]