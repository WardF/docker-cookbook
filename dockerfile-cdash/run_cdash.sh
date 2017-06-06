#!/bin/bash

docker run -d -it -p 80:80 -v ${HOME}/cdash-data:/var/lib/mysql cdash 
