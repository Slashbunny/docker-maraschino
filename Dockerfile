FROM linuxserver/baseimage.python

MAINTAINER smdion <me@seandion.com>

ENV APTLIST=""

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST -qy && \

# clan up
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
ADD init/ /etc/my_init.d/
ADD services/ /etc/service/
RUN chmod -v +x /etc/service/*/run && chmod -v +x /etc/my_init.d/*.sh

# Volumes and Ports
VOLUME /config
EXPOSE 7000

