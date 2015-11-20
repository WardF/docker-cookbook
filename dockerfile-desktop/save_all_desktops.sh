#!/bin/bash
#
# Utility script to save the various wardf/desktop configurations.
#

set -e
set -x

docker save -o wardf_desktop.tar wardf/desktop
docker save -o wardf_desktop-32.tar wardf/desktop:32
docker save -o wardf_desktop-openmpi.tar wardf/desktop:openmpi
docker save -o wardf_desktop-openmpi32.tar wardf/desktop:openmpi32
