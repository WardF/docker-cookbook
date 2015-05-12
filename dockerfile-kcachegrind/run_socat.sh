#!/bin/bash
#
# Only necessary on OSX.

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
