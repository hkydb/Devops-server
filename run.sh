#!/bin/sh
docker-compose -f ./sentry-setup-master/docker-compose.yaml -f ./hygieia-starter-kit-master/docker-compse.yaml up -d
