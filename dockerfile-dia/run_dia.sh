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
docker run -p 5901:5901 -v $(pwd):/home/dockuser/diagrams $1
