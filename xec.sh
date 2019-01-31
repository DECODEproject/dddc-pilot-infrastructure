#!/usr/bin/env bash

# This is an entry point for all the bash scripting that we provide with this module
# We also provide a makefile with some convenient shortcuts, but everything can be done from here for more fine grained control

#set -e # Exit script if anything fails
set -u # unset variables cause an error
set -o pipefail # https://coderwall.com/p/fkfaqq/safer-bash-scripts-with-set-euxo-pipefail
#set -x # for debugging each command

source ops/local/_lib.sh

function install {
    echo -e "'nInstalling 'xec' alias so you just have to type 'xec ...' instead of './xec.sh' ...\n"
    alias xec="./xec.sh"
    echo -e "\nIf you want this permanently just add it to your '.bashrc' file\n"

}

function ssh {
    ./ops/local/ssh-to.sh $@
}

function docker {
    ./ops/local/docker.sh $@
}

function chainspace {
    ./ops/local/chainspace.sh $@
}


function up {
    chainspace start
}

function down {
    chainspace stop
}

function status {
    chainspace status
}

function ping-prod {
    LOCAL_CONFIG=~/.decidim-env.sh

    if [[ -e ${LOCAL_CONFIG} ]]; then
        source ${LOCAL_CONFIG}
    else
        echo -e "Could not find the local source config [${LOCAL_CONFIG}, create it with the following structure \
              \nPROD_HOST=<the ip / dns of the production host box \
              \nPROD_USER=<your user name on the production host box \
              \n you can do this in one line like  echo -e \"export PROD_HOST=<host>\\\nexport PROD_USER=<user>\" > ~/.decidim-env.sh\
              \n you will also need jq installed to see pretty printing."
        exit 1
    fi

    echo "$ curl -sv http://${PROD_HOST}:5000/api/1.0/ | jq"
    curl -sv http://${PROD_HOST}:5000/api/1.0/ | jq

}

lib/process_commands $@
