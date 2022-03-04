#!/usr/bin/env bash
export DOCKER_HOST_IP=$(ipconfig getifaddr en0)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

if [ "$1" = "" ]; then
  echo "Stopping default docker compose file"
  docker-compose down
else
  echo "Stopping $1 docker compose file"
  docker-compose -f $1 down
fi