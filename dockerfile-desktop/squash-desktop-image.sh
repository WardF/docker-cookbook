#!/bin/bash
#
# Depends on docker-squash utility found at:
# - https://github.com/jwilder/docker-squash

set -e

PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

echo "======"
echo "Using tar: $(which tar)"
echo "======"
echo ""

docker save wardf/desktop | sudo docker-squash -verbose -t wardf/desktop -o wardf_desktop.tar
sudo chown wfisher wardf_desktop.tar

echo "Finished."
