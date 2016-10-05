#
# Dockerfile for gcacli on Rpi
#

FROM resin/rpi-raspbian

MAINTAINER David Tre (david.tre07@gmail.com)

LABEL version="1.0" \
      Author="David Tre (david.tre07@gmail.com)" \
      Description="Gcalcli"

RUN apt-get update \
  && apt-get install -y python-dev python-gflags python-dateutil python-httplib2 python-pip gcc \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install google-api-python-client \
  && pip install oauth2client \
  && pip install vobject parsedatetime gcalcli

RUN echo "#!/bin/bash\n\nwhile [ 1 ];do\n  /usr/local/bin/gcalcli agenda yesterday tomorrow --calendar Domoticz --military --tsv >/data/gcalcli.txt\n  sleep 600\ndone\n" >/root/start-gcalcli.sh \
  && chmod a+rx /root/start-gcalcli.sh

ENTRYPOINT ["/root/start-gcalcli.sh"]
