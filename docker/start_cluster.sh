#!/usr/bin/env bash

export DOCKER_HOST_IP=$(ipconfig getifaddr en0)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $DIR

rm -f tmp-data
mkdir -p tmp-data
chmod 777 tmp-data

if [ "$1" = "" ]; then
  echo "Starting default docker compose file"
  docker-compose up --build -d
  echo "====> Wait for all components to be ready (can take up to 1 minute)"
else
  echo "Starting $1 docker compose file"
  docker-compose -f $1 up --build -d
  echo "====> Wait for all components to be ready (can take up to 5 minutes)"
fi

### We wait for Kafka connect plugins to be ready, this takes the longest and guarantees
### other components (e.g. kafka, schema registry) will be ready by then
until $(curl --output /dev/null --silent --head --fail http://localhost:8083/connector-plugins); do
    printf '.'
    sleep 1
done
