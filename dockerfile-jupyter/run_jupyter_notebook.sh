#!/bin/bash

set -e

trap "echo TRAPed signal" HUP INT QUITE KILL TERM

if [ ! -d "/notebooks" ]; then
    cat README.md
    exit 0
fi

source ~/.virtualenvs/notebook/bin/activate
cd /notebooks
jupyter notebook
