#!/usr/bin/env bash

SCRIPT_HOME=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

CLUSTER_NAME="decode-decidim"

DOCKER_COMPOSE_CONFIG=${SCRIPT_HOME}/_docker-compose.yml
DOCKER_COMMAND="docker-compose -f ${DOCKER_COMPOSE_CONFIG}"

source ${SCRIPT_HOME}/_lib.sh


