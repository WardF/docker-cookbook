#!/bin/bash
#
# Utility script to start sshd.
#
#

set -e


trap "echo TRAPed signal" HUP INT QUIT KILL TERM

set -x
sudo service ssh start

echo ""
echo "sshd service (hopefully) started."
