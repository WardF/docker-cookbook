#!/bin/bash

build -t unidata/idv-base -f Dockerfile.base .
build -t unidata/idv-gui -f Dockerfile.gui .
