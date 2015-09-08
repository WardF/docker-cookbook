#!/bin/bash
#
# Utility script to recreate dockerfiles from a template.
#

./create_dockerfile.sh ubuntu:vivid vivid.x64
./create_dockerfile.sh "f69m\/ubuntu32:vivid" vivid.x86

./create_dockerfile.sh ubuntu:utopic utopic.x64
./create_dockerfile.sh "f69m\/ubuntu32:14.10" utopic.x86

./create_dockerfile.sh ubuntu:trusty trusty.x64
./create_dockerfile.sh "f69m\/ubuntu32:trusty" trusty.x86
