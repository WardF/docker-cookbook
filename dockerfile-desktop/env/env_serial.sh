#!/bin/bash

alias active="echo serial 1.8.20"

set -x

export CPPFLAGS="-I$HOME/environments/local-serial/include"
export CFLAGS="-I$HOME/environments/local-serial/include"
export LDFLAGS="-L$HOME/environments/local-serial/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-serial/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-serial/lib"
export PATH="$HOME/environments/local-serial/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-serial
set +x
