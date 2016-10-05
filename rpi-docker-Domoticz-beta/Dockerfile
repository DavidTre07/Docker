#
# Dockerfile for Domoticz on Rpi
#

FROM resin/rpi-raspbian

MAINTAINER David Tre (david.tre07@gmail.com)

ARG date

LABEL version="1.0" \
      Author="David Tre (david.tre07@gmail.com)" \
      Description="Domoticz Beta $date"

RUN apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y wget libcurl3 libraspberrypi-bin \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /domoticz \
  && chown 1000:1000 /domoticz \
  && groupadd -r -g 1000 pi \
  && useradd -r -u 1000 -g 1000 pi

#USER pi

RUN cd /domoticz \
  && wget -O domoticz.tgz "http://www.domoticz.com/download.php?channel=beta&type=release&system=linux&machine=armv7l" \
  && tar xvfz domoticz.tgz -C /domoticz \
  && rm domoticz.tgz

COPY lua/* /domoticz/scripts/lua

ENTRYPOINT ["/domoticz/domoticz"]
CMD ["-dbase", "/config/domoticz.db", "-log", "/config/domoticz.log", "-pidfile", "/config/domoticz.pid", "-sslcert", "/config/server_cert.pem", "-www", "8080", "-sslwww", "443"]
