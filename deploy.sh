#!/bin/bash

echo '- Update and restart of the docker compose'   
# docker compose up --force-recreate --build -d
docker compose down --volumes
docker compose build
docker compose create
docker compose cp application.properties server_co2:/usr/app/
docker compose start

echo '- Deleting all unused images'   
# docker image prune -f
