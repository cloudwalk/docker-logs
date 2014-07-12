#!/bin/bash

# Create dir for logrotate logs
mkdir -p $LOG_DIR

# Execute logrotate regurlary (couldn't get cron to work and need some work for container):
while true
do
    # Rotate logs and append output messages to $LOG_DIR/logrotate.log 
    logrotate  -v /etc/logrotate.d/logrotate_docker.conf >> $LOG_DIR/logrotate.log 2>&1
    
    # Execute it twice a day
    sleep 43200
done 