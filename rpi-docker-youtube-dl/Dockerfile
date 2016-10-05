#
# Dockerfile for youtube-dl on Rpi
#

FROM resin/rpi-raspbian

MAINTAINER David Tre (david.tre07@gmail.com)

LABEL version="1.0" \
      Author="David Tre (david.tre07@gmail.com)" \
      Description="Youtube-dl"

RUN apt-get update \
  && apt-get install -y apt-utils apt-file \
  && apt-get install -y python-pip libav-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip install youtube-dl

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
