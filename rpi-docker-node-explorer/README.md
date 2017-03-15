# Docker for Node Exporter
This Dockerfile will build a docker with Node Exporter inside

## Build
```
export VER=0.13.0
docker build -t davidtre07/node-exporter:latest -t davidtre07/node-exporter:$VER --build-arg version=$VER .
```

## Folders
No need of config or data folder or files

## Run the docker
```
docker run --rm --name=Node-Exporter -p 9100:9100 \
  -v "/proc:/host/proc" \
  -v "/sys:/host/sys" \
  -v "/:/rootfs" \
  --net="host" \
  davidtre07/node-exporter \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
```

## Swarm
```
docker service create --mode global --name Node-Exporter \
  --mount type=bind,source=/proc,destination=/host/proc \
  --mount type=bind,source=/sys,destination=/hosts/sys \
  --mount type=bind,source=/,destination=/rootfs \
  --publish mode=host,target=9100,published=9100 \
  davidtre07/node-exporter \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
```

## Traefik
```
docker service create --mode global --name Node-Exporter \
  --mount type=bind,source=/proc,destination=/host/proc \
  --mount type=bind,source=/sys,destination=/hosts/sys \
  --mount type=bind,source=/,destination=/rootfs \
  --publish mode=host,target=9100,published=9100 \
  --label traefik.enable=false \
  davidtre07/node-exporter \
    -collector.procfs /host/proc \
    -collector.sysfs /host/sys \
    -collector.filesystem.ignored-mount-points "^/(sys|proc|dev|host|etc)($|/)"
```
