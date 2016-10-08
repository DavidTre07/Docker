[![Build Status](https://travis-ci.org/DavidTre07/Docker.svg)](https://travis-ci.org/DavidTre07/Docker)

# Docker for Domoticz Beta
This Dockerfile will build a docker with a beta version of Domoticz

## Build
docker build -t DavidTre07/domoticz-beta:\`date +%Y%m%d\` -t DavidTre07/domoticz-beta:latest --build-arg date=\`date +%Y%m%d\` .

## Folders
Create a folder like "Domoticz" for example.
Create a folder in it "scripts/lua" where you can copy some lua scripts

## Files
On the folder you previously created, some files will be created like domoticz.db and domoticz.log.
If you already use Domoticz and you want to migrate to the docker version, just copy your domoticz.db in this folder.

## Run the docker
docker run --rm -p 8080:8080 -p 443:443 --name=Domoticz -v /config/domoticz:/config:rw -v /config/data:/data:rw -v /etc/localtime:/etc/localtime:ro --device=/dev/ttyUSB0:/dev/ttyUSB0 DavidTre07/domoticz-beta:latest

