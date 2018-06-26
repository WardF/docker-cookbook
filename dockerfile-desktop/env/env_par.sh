#!/bin/bash

alias active="echo parallel 1.8.x"

set -x
export CC=mpicc
export CPPFLAGS="-I$HOME/environments/local-par/include"
export CFLAGS="-I$HOME/environments/local-par/include"
export LDFLAGS="-L$HOME/environments/local-par/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-par/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-par/lib"
export PATH="$HOME/environments/local-par/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-par
export CMAKE_C_COMPILER=mpicc
set +x
