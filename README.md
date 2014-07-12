# CloudWalk Docker logs

This is a container that mounts `/var/log/docker` for others containers to use as a centralized log repository. The only process executed inside the container is `logrotate`, executed hourly to keep the size of our logs files bounded. You can configure `logrotate` in file [logrotate_docker.conf]

Additionaly, if we want logs persistence, we can bind it to host's `/var/log/docker`, so that we don't loose our logs data in case of container's failure.

## Usage

```
sudo docker run --name logs -v /var/log/docker:/var/log/docker -d cloudwalk/logs
```

We use the `-v` flag to bind host's to container's mount points. In case we want to bind different directories, note the order: `-v /host/dir:/container/dir`.

[logrotate_docker.conf]:logrotate_docker.conf