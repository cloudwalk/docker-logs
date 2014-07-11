FROM ubuntu:14.04

MAINTAINER Allan Costa "allan@cloudwalk.io"

RUN apt-get install -y nano

VOLUME /var/log/docker

ENV LOG_DIR /var/log/docker/logrotate

ADD logrotate_docker /etc/logrotate.d/logrotate_docker
ADD logrotate_hourly /etc/cron.hourly/logrotate_hourly
ADD startup.sh /usr/local/bin/startup.sh


CMD ["startup.sh"]