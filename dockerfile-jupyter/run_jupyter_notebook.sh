#!/bin/bash

set -e

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

if [ ! -d "/notebooks" ]; then
    cat README.md
    exit 0
fi

cd /notebooks
source /root/miniconda3/bin/activate workshop2015
ipython notebook --no-browser --ip=*
