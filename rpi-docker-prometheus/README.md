# Docker for Prometheus
This Dockerfile will build a docker with Prometheus

## Build
```
export VER="1.5.2"
docker build -t davidtre07/prometheus:${VER} -t davidtre07/prometheus:latest --build-arg version=${VER} .
```

## Folders
Create a folder like "prometheus" in data (for data persistency).

## Files


## Run the docker
```
docker run --rm -p 9090:9090 --name=Prometheus -v /docker/data/prometheus/:/prometheus davidtre07/prometheus:latest
```

## Swarm
```
docker service create --replicas 1 --name Prometheus \
	--mount type=bind,source=/docker/data/prometheus,destination=/prometheus \
	--mount type=bind,source=/docker/config/prometheus/,destination=/etc/prometheus \
	--publish 9090:9090/tcp \
	davidtre07/prometheus:latest
```

## Traefik
```
docker service create --replicas 1 --name Prometheus \
	--mount type=bind,source=/docker/data/prometheus/,destination=/prometheus \
	--mount type=bind,source=/docker/config/prometheus/,destination=/etc/prometheus \
	--publish 9090:9090/tcp \
	--label traefik.enable=false \
	davidtre07/prometheus:latest
```

