#!/usr/bin/env bash

source ./ci/compute-env.sh

ENV_FILE="./admin/mastodon-terms.env"

echo "LOG_LEVEL=${LOG_LEVEL}" > "${ENV_FILE}"
echo "DB_HOST=${DB_HOST}" >> "${ENV_FILE}"
echo "DB_PORT=${DB_PORT}" >> "${ENV_FILE}"
echo "DB_NAME=${DB_NAME}" >> "${ENV_FILE}"
echo "DB_USER=${DB_USER}" >> "${ENV_FILE}"
echo "DB_PASSWORD=${DB_PASSWORD}" >> "${ENV_FILE}"

cp terms.html ./admin/

docker-compose -f ./admin/docker-compose.yml up ${DOCKER_BUILD_OPT} --force-recreate update-rules
