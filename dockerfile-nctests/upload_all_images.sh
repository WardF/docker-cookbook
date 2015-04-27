#!/bin/bash

docker push wardf/nctests
docker push wardf/nctests:64
docker push wardf/nctests:32
docker push wardf/nctests:openmpi
docker push wardf/nctests:mpich
