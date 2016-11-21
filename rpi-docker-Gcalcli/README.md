# Create a Docker with gcalcli

Some documentation how it works (sorry in French) here: http://easydomoticz.com/agenda-google-et-domoticz-version-2-partie-1/

#Build
```
docker build -t david07/gcalcli:\`date +%Y%m%d\` -t david07/gcalcli:latest .
```

# Startup
```
docker run --rm -v /docker/config/gcalcli/.gcalcli_oauth:/root/.gcalcli_oauth  -v /docker/config/gcalcli:/config:rw -v /docker/data/gcalcli:/data:rw -v /etc/localtime:/etc/localtime:ro davidtre07/gcalcli
```

#Swarm
```
docker service create --replicas 1 --name Gcalcli \
  --mount type=bind,source=/docker/config/gcalcli/.gcalcli_oauth,destination=/root/.gcalcli_oauth \
  --mount type=bind,source=/docker/config/gcalcli,destination=/config \
  --mount type=bind,source=/docker/data/gcalcli,destination=/data \
  --mount type=bind,source=/etc/localtime,destination=/etc/localtime,ro \
  davidtre07/gcalcli
```

