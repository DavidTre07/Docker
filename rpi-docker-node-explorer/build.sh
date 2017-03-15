#!/bin/bash

#VER=0.13.0
VER=0.14.0-rc.2
wget https://github.com/prometheus/node_exporter/releases/download/v$VER/node_exporter-$VER.linux-armv5.tar.gz
mkdir -p dd/lib
tar xvf node_exporter-$VER.linux-armv5.tar.gz -C dd --strip-components=1
rm node_exporter-$VER.linux-armv5.tar.gz
#cp /lib/ld-linux.so.3 /lib/arm-linux-gnueabihf/libpthread.so.0 dd/lib

docker build -t davidtre07/node-exporter:latest -t davidtre07/node-exporter:$VER --build-arg version=$VER .

rm -fr dd
