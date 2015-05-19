#!/bin/bash
#
# Only necessary on OSX.
set -x
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
