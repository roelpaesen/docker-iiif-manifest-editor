FROM ubuntu:focal
MAINTAINER roel paesen <roel.paesen@africamuseum.be>

RUN mkdir /script
ADD run.sh /script/run.sh

RUN chmod +x /script/*.sh


RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata apt-utils locales
RUN	locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN apt-get -y install vim curl wget git python build-essential nodejs npm
RUN mkdir -p /var/www/iiif-manifest-editor
RUN apt-get -y dist-upgrade

RUN git clone https://github.com/bodleian/iiif-manifest-editor.git /var/www/iiif-manifest-editor

WORKDIR /var/www/iiif-manifest-editor

RUN npm install node-sass

WORKDIR /var/www/iiif-manifest-editor

ENTRYPOINT ["/script/run.sh"]
