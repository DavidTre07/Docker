#!/bin/bash

export VER=1.5.2
wget https://github.com/prometheus/prometheus/releases/download/v$VER/prometheus-$VER.linux-armv5.tar.gz
mkdir dd
tar xvf prometheus-$VER.linux-armv5.tar.gz -C dd --strip-components=1
rm prometheus-$VER.linux-armv5.tar.gz
cd dd
mkdir -p etc/prometheus
mkdir -p usr/share/prometheus
mkdir bin
mv prometheus promtool bin/
mv prometheus.yml etc/prometheus/
mv console_libraries/ usr/share/prometheus/
mv consoles/ usr/share/prometheus/
cd ..

docker build -t davidtre07/prometheus:${VER} -t davidtre07/prometheus:latest --build-arg version=${VER} .

rm -fr dd
