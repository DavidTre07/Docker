# Create a Docker with gcalcli

Some documentation how it works (sorry in French) here: http://easydomoticz.com/agenda-google-et-domoticz-version-2-partie-1/

#Build
docker build -t david07/gcalcli:\`date +%Y%m%d\` -t david07/gcalcli:latest .

# Startup
docker run --rm -v /config/gcalcli/.gcalcli_oauth:/root/.gcalcli_oauth  -v /config/gcalcli:/config:rw -v /config/data:/data:rw -v /etc/localtime:/etc/localtime:ro david07/gcalcli
