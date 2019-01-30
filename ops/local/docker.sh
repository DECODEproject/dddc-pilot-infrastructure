#!/usr/bin/env bash

set -e # Exit script if anything fails
set -u # unset variables cause an error
set -o pipefail # https://coderwall.com/p/fkfaqq/safer-bash-scripts-with-set-euxo-pipefail
#set -x # for debugging each command

SCRIPT_HOME=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

source ${SCRIPT_HOME}/_env.sh


function status {
    echo -e "Status of local docker:\n"
    echo -e "Docker Config: \n${DOCKER_COMPOSE_CONFIG}\n"


    ${DOCKER_COMMAND} ps


}

function init {
    ${DOCKER_COMMAND} up --no-start

}

lib/process_commands $@
