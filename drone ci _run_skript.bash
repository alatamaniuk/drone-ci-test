#!/usr/bin/env bash

set -ex

GITHUB_CLIENT_ID=6498281c729b79eaab3e &&
GITHUB_CLIENT_SECRET=9bbcd2a327ee813c0a85e15a06f6775683f62465 &&
SHARED_SECRET=48367f94c9383445067546838602bb97 &&
SERVER_HOST=192.168.30.65 &&
SERVER_PROTOCOL=http &&
 
docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --volume=/var/lib/drone:/data \
  --env=DRONE_GITHUB_SERVER=https://github.com \
  --env=DRONE_GITHUB_CLIENT_ID=${GITHUB_CLIENT_ID} \
  --env=DRONE_GITHUB_CLIENT_SECRET=${GITHUB_CLIENT_SECRET} \
  --env=DRONE_AGENTS_ENABLED=true \
  --env=DRONE_RPC_SECRET=${SHARED_SECRET} \
  --env=DRONE_SERVER_HOST=${SERVER_HOST} \
  --env=DRONE_SERVER_PROTO=${SERVER_PROTOCOL} \
  --env=DRONE_TLS_AUTOCERT=true \
  --publish=80:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone:1