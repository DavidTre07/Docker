# Docker for portainer
This Dockerfile will build a docker with portainer

## Build
Use the build.sh script

## Folders
Create a folder like "portainer" for example in data.

## Files
No conf files

## Run the docker
```
docker run --rm -p 28080:80 --name=Nginx -v /docker/config/portainer:/etc/portainer davidtre07/portainer:latest
```

## Swarm
```
docker service create --replicas 1 --name Portainer \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock  \
	--publish 9000:9000/tcp \
	davidtre07/portainer:1.12.1 -H unix:///var/run/docker.sock --no-analytics
```

##Traefik
```
docker service create --replicas 1 --name Portainer \
	--mount type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock  \
	--network proxy \
	--label traefik.enable=true \
	--label traefik.frontend.rule="Host:portainer, portainer.lan, swarm, swarm.lan" \
	--label traefik.port=9000 \
	davidtre07/portainer:1.12.1 -H unix:///var/run/docker.sock --no-analytics
```
