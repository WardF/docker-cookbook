#!/bin/bash
#
# Utility script to recreate dockerfiles from a template.
#

./create_dockerfile ubuntu:vivid vivid.x64
./create_dockerfile f69m/ubuntu32:vivid vivid.x86

./create_dockerfile ubuntu:utopic utopic.x64
./create_dockerfile f69m/ubuntu32:14.10 utopic.x86

./create_dockerfile ubuntu:trusty trusty.x64
./create_dockerfile f69m/ubuntu32:trusty trusty.x86
