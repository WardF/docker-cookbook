#!/bin/bash

#####
# Update package list, install some default packages.
#####
apt-get update
apt-get -y upgrade
apt-get install -y git curl

#####
# Install docker.io, using instructions from:
# https://docs.docker.com/installation/ubuntulinux/
#####
curl -sSL https://get.docker.com/ubuntu/ | sudo sh

##
# Allow for non-root access.
##
sudo gpasswd -a vagrant docker
sudo service docker restart

##
# Set up a readme
##
TFILE=README_DOCKER_TEST.md
echo "docker run -i -t ubuntu /bin/bash" > $TFILE

#####
# Cleanup
#####
chown -R vagrant:vagrant /home/vagrant
