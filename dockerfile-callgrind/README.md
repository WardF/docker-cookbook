# wardf/callgrind


This project is an initial pass at creating a (semi) portable environment for generating debug information using `Valgrind`, `Callgrind` and `KCachegrind`. 

This image is suitable for use on linux, naturally, and OSX.  The `kcachegrind` program is run on the desktop via `X11`.  As a result, there are a number of arguments to `docker run` which must be passed.  For ease-of-use, I have created some utility scripts which are embedded in this image.

## Bootstrapping the Utility Scripts

The following files are embedded in this image:

* Dockerfile - The Dockerfile used to build this image.
* README.md - This file.
* run_callgrind_env.sh - A utility script used to invoke the image such that `kcachegrind` will be displayed locally via `X11`.  
* run_socat.sh - A utility script for OSX users.  `socat` may be installed via `homebrew`.  `socat` allows the host and client `X11` systems to talk to each other over a TCP port.

To extract these files from the image, run the following command:

    $ docker run --rm -it -v $(pwd):/host wardf/callgrind bash
    
This will but you on the command line of the docker image.  Once there, run the following commands:

    $ cd /root
    $ cp Dockerfile README.md run_callgrind_env.sh run_socat.sh /host
    $ exit
    
These files should now exist in the directory from which docker was run.

> For specifics, view the individual scripts. To avoid duplicating information, I will not elaborate upon their contents here.

## Using this image

This image is meant to be run from the top-level directory of a software project.  It allows for compilation, analysis and visualization of callgraphs, as well as other debugging/development tasks.  The typical workflow will be as follows:

### Workflow

Connect to the command line in the docker image, with a working directory of /workdir.

    $ ./run_callgrind_env.sh wardf/callgrind 
    
Next, build the project in typical fashion from the command line. Run `configure`, `make`, etc.


Then, generate the callgraph/diagnostic information for the test executable as follows:

	$ valgrind --tool=callgrind [executable to debug] 
	
Finally, visualize the callgraph file (do an `ls call*` to find the output file created by valgrind.

    $ kcachegrind [file]
    
> NOTE TO OSX USERS: Don't forget to run `socat` before running `kcachegrind`, either via the `run_socat.sh` script or by hand (view the contents of `run_socat.sh` for details on what it's doing).  If you get an error message when invoking `socat`, you may need to kill any active `X11` sessions.