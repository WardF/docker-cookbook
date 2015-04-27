#!/bin/bash

docker build -t wardf/nctests:base -f Dockerfile.base .
docker build -t wardf/nctests -f Dockerfile.serial .
docker build -t wardf/nctests:serial -f Dockerfile.serial .
docker build -t wardf/nctests:openmpi -f Dockerfile.openmpi .
docker build -t wardf/nctests:mpich -f Dockerfile.mpich .
