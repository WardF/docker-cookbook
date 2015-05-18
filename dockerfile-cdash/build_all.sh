#!/bin/bash

set -x

docker build -t wardf/cdash:base -f Dockerfile.cdash_base .

docker build -t wardf/cdash:netcdf -f Dockerfile.cdash_netcdf .
