# Docker for Traefik
This Dockerfile will build a docker with Traefik

## Build
Use build.sh script

## Folders
Create a folder like "traefik" for example in config folder.

## Files
Put a toml conf file in it a mount it during docker startup.

## Run the docker
```
docker run --rm -p 8080:8080 -p 80:80 --name=Traefik -v /docker/config/traefik/traefik.toml:/etc/traefik/traefik.toml -v /var/run/docker.sock:/var/run/docker.sock davidtre07/traefik:1.2.0-rc2
```

## Swarm
Create specific network:
```
docker network create --driver overlay proxy
```

Start service with the network linked to it, also force the service to run on manager:
```
docker service create --replicas 1 --name Traefik \
	--constraint=node.role==manager \
	--mount type=bind,source=/docker/config/traefik/traefik.toml,destination=/etc/traefik/traefik.toml \
	--mount type=bind,source=/var/run/docker.sock,destination=/var/run/docker.sock \
	--publish 8080:8080/tcp --publish 80:80/tcp \
	--network proxy \
	davidtre07/traefik:1.2.0-rc2
```
