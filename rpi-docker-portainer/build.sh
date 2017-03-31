#!/bin/bash

if [ "x$1" != "x" ];then VER=$1
else VER=1.12.2
fi

wget https://github.com/portainer/portainer/releases/download/$VER/portainer-$VER-linux-arm.tar.gz

mkdir dd
tar xvf portainer-$VER-linux-arm.tar.gz -C dd --strip-components=1
rm portainer-$VER-linux-arm.tar.gz

docker build -t davidtre07/portainer:latest -t davidtre07/portainer:$VER --build-arg version=$VER .

rm -fr dd
