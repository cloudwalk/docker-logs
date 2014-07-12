FROM ubuntu

MAINTAINER Allan Costa <allan@cloudwalk.io>

# Install logrotate
RUN apt-get install -y logrotate

# Volume mounted inside the container
VOLUME /var/log/docker

# Directory to save logrotate logs
ENV LOG_DIR /var/log/docker/logrotate

# Add logrotate configuration for Docker logs
ADD logrotate_docker.conf /etc/logrotate.d/logrotate_docker.conf

# Add startup script to create logs dir and keep container alive
ADD startup.sh /usr/local/bin/startup.sh

ENTRYPOINT ["startup.sh"]