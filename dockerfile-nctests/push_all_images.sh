#!/bin/bash

docker push wardf/nctests:base
docker push wardf/nctests
docker push wardf/nctests:serial
docker push wardf/nctests:openmpi
docker push wardf/nctests:mpich
