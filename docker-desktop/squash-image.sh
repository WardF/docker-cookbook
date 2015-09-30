#!/bin/bash
#
# Depends on docker-squash utility found at:
# - https://github.com/jwilder/docker-squash

set -e

docker save wardf/desktop | sudo docker-squash -verbose -t wardf/desktop -o wardf_desktop.tar
sudo chown wfisher:wfisher wardf_desktop.tar

echo "Finished."
