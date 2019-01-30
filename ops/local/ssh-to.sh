#!/usr/bin/env bash

set -e # Exit script if anything fails
set -u # unset variables cause an error
set -o pipefail # https://coderwall.com/p/fkfaqq/safer-bash-scripts-with-set-euxo-pipefail
#set -x # for debugging each command

SCRIPT_HOME=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)

source ${SCRIPT_HOME}/_lib.sh

LOCAL_CONFIG=~/.decidim-env.sh

if [[ -e ${LOCAL_CONFIG} ]]; then
    source ${LOCAL_CONFIG}
else
    echo -e "Could not find the local source config [${LOCAL_CONFIG}, create it with the following structure \
          \nPROD_HOST=<the ip / dns of the production host box \
          \nPROD_USER=<your user name on the production host box \
          \n you can do this in one line like  echo -e \"export PROD_HOST=<host>\\\nexport PROD_USER=<user>\" > ~/.decidim-env.sh"
    exit 1
fi

function prod {
    echo "ssh'ing to production environment @ ${PROD_HOST} ..."
    set -x
    ssh ${PROD_USER}@${PROD_HOST}
    set +x
}

lib/process_commands $@

