#!/bin/bash

cd ./Server-Data
mkdir Backup

echo '## Building Docker image cbind/valheimserver'
docker build -t --no-cache  cbind/valheimserver:latest .

echo '## Starting valheim server'
docker run -d --rm -p 2456-2458:2456-2458/tcp -p 2456-2458:2456-2458/udp -v /home/valheim/server/Server-Data/Backup:/root/.config/unity3d/IronGate/Valheim --name "cbind-valheimserver" cbind/valheimserver:latest
