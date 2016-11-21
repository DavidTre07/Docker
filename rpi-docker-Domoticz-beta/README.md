# Docker for Domoticz Beta
This Dockerfile will build a docker with a beta version of Domoticz

## Build
```
docker build -t davidtre07/domoticz-beta:\`date +%Y%m%d\` -t davidtre07/domoticz-beta:latest --build-arg date=\`date +%Y%m%d\` .
```

## Folders
Create a folder like "Domoticz" for example.

## Files
On the folder you previously created, some files will be created like domoticz.db and domoticz.log.
If you already use Domoticz and you want to migrate to the docker version, just copy your domoticz.db in this folder.

## Run the docker
```
docker run --rm -p 8080:8080 -p 443:443 --name=Domoticz -v /docker/config/domoticz:/config:rw -v /docker/data/domoticz:/data:rw -v /etc/localtime:/etc/localtime:ro --device=/dev/ttyUSB0:/dev/ttyUSB0 davidtre07/domoticz-beta:latest
```

## Swarm
```
docker service create --replicas 1 --name Domoticz \
  --mount type=bind,source=/docker/config/domoticz,destination=/config \
  --mount type=bind,source=/docker/data/gcalcli,destination=/data \
  --mount type=bind,source=/etc/localtime,destination=/etc/localtime,ro \
  --publish 8080:8080/tcp --publish 443:443/tcp \
  davidtre07/domoticz-beta
```
