#!/bin/bash

docker build -t wardf/nctests -f Dockerfile .
docker build -t wardf/nctests:64 -f Dockerfile .
docker build -t wardf/nctests:32 -f Dockerfile.32bit .
docker build -t wardf/nctests:openmpi -f Dockerfile.openmpi .
docker build -t wardf/nctests:mpich -f Dockerfile.mpich .
