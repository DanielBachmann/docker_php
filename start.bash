#!/usr/bin/env bash
docker-compose -f ./.docker/docker-compose.yml up
docker-compose exec "chmod 777 /wp-content/banners"