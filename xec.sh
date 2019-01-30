#!/usr/bin/env bash

# This is an entry point for all the bash scripting that we provide with this module
# We also provide a makefile with some convenient shortcuts, but everything can be done from here for more fine grained control

set -e # Exit script if anything fails
set -u # unset variables cause an error
set -o pipefail # https://coderwall.com/p/fkfaqq/safer-bash-scripts-with-set-euxo-pipefail
#set -x # for debugging each command

source ops/local/_lib.sh

function install {
    echo -e "'nInstalling 'xec' alias so you just have to type 'xec ...' instead of './xec.sh' ...\n"
    alias do="./xec.sh"
    echo -e "\nIf you want this permanently just add it to your '.bashrc' file\n"

}

function ssh {
    ./ops/local/ssh-to.sh $@
}

lib/process_commands $@
