![https://linuxserver.io](https://www.linuxserver.io/wp-content/uploads/2015/06/linuxserver_medium.png)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring easy user mapping and community support. Find us for support at:
* [forum.linuxserver.io](https://forum.linuxserver.io)
* [IRC](https://www.linuxserver.io/index.php/irc/) on freenode at `#linuxserver.io`
* [Podcast](https://www.linuxserver.io/index.php/category/podcast/) covers everything to do with getting the most from your Linux Server plus a focus on all things Docker and containerisation!

# linuxserver/maraschino
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/maraschino.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/maraschino.svg)][hub]
[![Build Status](http://jenkins.linuxserver.io:8080/buildStatus/icon?job=Dockers/LinuxServer.io/linuxserver-maraschino)](http://jenkins.linuxserver.io:8080/job/Dockers/job/LinuxServer.io/job/linuxserver-maraschino/)
[hub]: https://hub.docker.com/r/linuxserver/maraschino/

Maraschino, a simple web interface to act as a nice overview/front page for my XBMC HTPC.

## Usage
[![maraschino](https://pixabay.com/static/uploads/photo/2013/04/16/19/12/cherry-105141_960_720.png)][maraurl]
[maraurl]: http://www.maraschinoproject.com/

```
docker create \
--name=maraschino \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-p 7000:7000 \
linuxserver/maraschino
```

**Parameters**

* `-p 7000` - the port(s)
* `-v /config` - where maraschino should store its configuration files.
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

It is based on alpine linux with s6 overlay, for shell access whilst the container is running do `docker exec -it maraschino /bin/bash`.

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

The webui is found at port 7000.


## Info

* To monitor the logs of the container in realtime `docker logs -f maraschino`.

## Versions

+ **29.08.16:** Rebase to alpine.
+ **09.11.15:** Initial Release.


