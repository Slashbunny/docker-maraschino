
# maraschino docker image

Maraschino, a simple web interface to act as a nice overview/front page for my XBMC HTPC.

This is a fork of linuxserver.io's image

## Usage

```
docker create \
--name=maraschino \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> \
-p 7000:7000 \
linuxserver/maraschino
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side.
For example with a port -p external:internal - what this shows is the port mapping from internal to external of the container.
So -p 8080:80 would expose port 80 from inside the container to be accessible from the host's IP on port 8080
http://192.168.x.x:8080 would show you what's running INSIDE the container on port 80.`


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

* container version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' maraschino`

* image version number

`docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/maraschino`

