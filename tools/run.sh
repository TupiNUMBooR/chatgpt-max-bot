#!/usr/bin/env bash
# run.sh
echo up
docker compose up --build
echo down
docker compose down --remove-orphans
