#!/bin/bash
#
# Used to kick off apache2, tomcat
# at boot when the docker container starts.

trap "echo TRAPed signal" HUP INT QUIT KILL TERM

set -x
apache2ctl start
sleep 3
/etc/init.d/tomcat start

sleep 10

# For now, just sleep really long to avoid exiting. Fix later.
echo ""

echo "[Hit ENTER key to exit] or run 'docker stop <container>'"

read

echo "Stopping."
