#!/bin/bash
#
# Used to kick off apache2, tomcat
# at boot when the docker container starts.
set -x
apache2ctl start
sleep 3
/etc/init.d/tomcat start

sleep 10

# For now, just sleep really long to avoid exiting. Fix later.
sleep 10000
