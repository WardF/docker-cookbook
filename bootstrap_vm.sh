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
TFILE=DOCKER_NOTES.md
echo "# Docker Notes:" > $TFILE
echo "docker run -i -t ubuntu /bin/bash" >> $TFILE
echo "" >> $TFILE
echo "# Delete all containers:" >> $TFILE
echo " docker rm $(docker ps -a -q)" >> $TFILE
echo "# Delete all images:" >> $TFILE
echo " docker rmi $(docker images -q)" >> $TFILE

#####
# Cleanup
#####
chown -R vagrant:vagrant /home/vagrant
