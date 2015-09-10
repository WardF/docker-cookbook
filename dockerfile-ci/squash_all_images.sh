#!/bin/bash
#
# Depends on docker-squash utility found at:
# - https://github.com/jwilder/docker-squash
#
# Note that there is a markdown file with OSX-specific
# instructions.

set -e

PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

IMGS="unidata/ncci:vivid-x64 \
unidata/ncci:vivid-x86 \
unidata/ncci:utopic-x64 \
unidata/ncci:utopic-x86 \
unidata/ncci:trusty-x64 \
unidata/ncci:trusty-x86 \
unidata/ncci:fedora22-x64 \
unidata/ncci:fedora21-x64 \
unidata/ncci:centos7-x64"


for X in $IMGS; do
    echo $X
    set -x
    docker save $X | sudo TMPDIR=/sandbox/tmp docker-squash -verbose -t $X | docker load
    set +x
done
