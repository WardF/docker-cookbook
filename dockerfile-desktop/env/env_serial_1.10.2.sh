#!/bin/bash

alias active="echo serial 1.10.2"

set -x

export CPPFLAGS="-I$HOME/environments/local-serial-1.10.2/include"
export CFLAGS="-I$HOME/environments/local-serial-1.10.2/include"
export LDFLAGS="-L$HOME/environments/local-serial-1.10.2/lib"
export LD_LIBRARY_PATH="$HOME/environments/local-serial-1.10.2/lib"
export DYLD_LIBRARY_PATH="$HOME/environments/local-serial-1.10.2/lib"
export PATH="$HOME/environments/local-serial-1.10.2/bin:$PATH"
export CMAKE_PREFIX_PATH=$HOME/environments/local-serial-1.10.2
set +x
