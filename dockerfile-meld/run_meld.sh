#!/bin/bash
#
# Convienence script to launch a docker container version of dia with all of the appropriate arguments.

OSTYPE="osx"

if [ $# -lt 4 ]; then
    docker images
    echo ""
    echo "You must specify an OS and a docker image."
    echo "example: $0 linux wardf/meld [directory 1] [directory 2] [Optional Command]"
    echo "OS Options:"
    echo -e "\tlinux"
    echo -e "\tosx"
    exit 1
fi

set -x



##
# The following is used on OSX.
# It may or may not work on Linux or Windows.
# Will update as need be.
#
# Note, also, that when using `boot2docker`, the volume mount
# will not work unless $(pwd) is a subdirectory of $HOME.
#
# Finally, on OSX, we must also be using socat. See USAGE.md
# for more information.
##

if [ "X$1" == "Xosx" ]; then
    MYIP=$(curl ipecho.net/plain)
    docker run --rm -e DISPLAY=$MYIP:0 --net=host -v $3:/former -v $4:/latter $2 $5
fi

if [ "X$1" == "Xlinux" ]; then
    docker run --rm -e DISPLAY --net=host -v $3:/former -v $4:/latter -v $HOME/.Xauthority:/root/.Xauthority $2 $5
fi
