#!/bin/bash

alias active="echo parallel 1.10.2"

set -x
export CC=mpicc
export CPPFLAGS="-I$HOME/environments/local-par-1.10.2/include"
export CFLAGS="-I$HOME/environments/local-par-1.10.2/include"
export LDFLAGS="-L$HOME/environments/local-par-1.10.2/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-par-1.10.2/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-par-1.10.2/lib"
export PATH="$HOME/environments/local-par-1.10.2/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-par-1.10.2
export CMAKE_C_COMPILER=mpicc
set +x
