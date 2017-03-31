#!/bin/bash

#VER=1.1.2
VER=1.2.1

wget https://github.com/containous/traefik/releases/download/v${TAG}/traefik_linux-arm
chmod +x traefik_linux-arm
docker build -t davidtre07/traefik:$VER -t davidtre07/traefik:latest .
rm traefik_linux-arm
