USAGE on OSX

First, start socat:

    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

Launching image on OSX via boot2docker:

    docker run --rm -e DISPLAY=$(HOST IP):0 -v $(pwd):/workingdir <image name>

NOTE: If using on OSX or Windows via boot2docker, $(pwd) must be a subdirectory of $HOME!

