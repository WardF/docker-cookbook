#!/bin/bash
#
# Convienence script to launch a docker container version of dia with all of the appropriate arguments.

if [ $# -lt 1 ]; then
    docker images
    echo ""
    echo "You must specify a docker image."
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
# Finally, on OSX, we must also be using socat. See NOTES.md
# for more information.
##
MYIP=$(curl ipecho.net/plain)
docker run --rm -e DISPLAY=$MYIP:0 --net=host -v $(pwd):/root/diagrams $1
