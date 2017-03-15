# Docker for nginx
This Dockerfile will build a docker with nginx

## Build
```
docker build -t davidtre07/nginx:\`date +%Y%m%d\` -t davidtre07/nginx:latest .
```

## Folders
Create a folder like "nginx" for example in config.

## Files
External conf file

## Run the docker
```
docker run --rm -p 28080:80 --name=Nginx -v /docker/config/nginx:/etc/nginx davidtre07/nginx:latest
```

## Swarm
```
docker service create --replicas 1 --name Nginx \
	--mount type=bind,source=/docker/config/nginx,destination=/etc/nginx \
	--publish 28080:80/tcp \
	davidtre07/nginx
```

##Traefik
```
docker service create --replicas 1 --name Nginx \
        --mount type=bind,source=/docker/config/nginx,destination=/etc/nginx \
	--network proxy \
        --label traefik.enable=true \
	--label traefik.frontend.rule="Host:domotique, domotique.lan" \
	--label traefik.port=80 \
	davidtre07/nginx
```
