#!/bin/bash
#
# Utility script to recreate dockerfiles from a template.
#

###
# Create Ubuntu Dockerfiles.
###
./create_dockerfile.sh templates/Dockerfile.apt.generic "ubuntu:vivid" vivid-x64
./create_dockerfile.sh templates/Dockerfile.apt.generic "f69m\/ubuntu32:vivid" vivid-x86

./create_dockerfile.sh templates/Dockerfile.apt.generic "ubuntu:utopic" utopic-x64
./create_dockerfile.sh templates/Dockerfile.apt.generic "f69m\/ubuntu32:14.10" utopic-x86

./create_dockerfile.sh templates/Dockerfile.apt.generic "ubuntu:trusty" trusty-x64
./create_dockerfile.sh templates/Dockerfile.apt.generic "f69m\/ubuntu32:trusty" trusty-x86

###
# Create Fedora and Centos Dockerfiles
###
./create_dockerfile.sh templates/Dockerfile.dnf.generic "fedora:22" fedora22-x64

./create_dockerfile.sh templates/Dockerfile.yum.generic "fedora:21" fedora21-x64
./create_dockerfile.sh templates/Dockerfile.yum.generic "centos:7" centos7-x64
