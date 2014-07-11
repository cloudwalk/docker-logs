FROM ubuntu:14.04

MAINTAINER Allan Costa "allan@cloudwalk.io"

# Volume mounted inside the container
VOLUME /var/log/docker

# Directory to save logrotate logs
ENV LOG_DIR /var/log/docker/logrotate

# Add logrotate configuration for Docker logs
ADD logrotate_docker.conf /etc/logrotate.d/logrotate_docker.conf

# Add hourly crontab job 
ADD logrotate_hourly /etc/cron.hourly/logrotate_hourly

# Add startup script to create logs dir and keep container alive
ADD startup.sh /usr/local/bin/startup.sh

ENTRYPOINT ["startup.sh"]