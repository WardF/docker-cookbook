# Docker Notes


    Working project: wardf/idv

* You *start* a container by running a process in it.
* Docker stops when the command/process exits.

> Note that even though the container stops right after a command completes, the changes are not forgotten.

## References

* GUI apps with Docker: http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/
* X2Go: http://wiki.x2go.org/doku.php/doc:newtox2go


### Fluxbox Reference

Fluxbox is a lightweight Windows manager used with `x11vnc`, `xvfb`.

* https://wiki.archlinux.org/index.php/Fluxbox

### GUI Apps with Docker

From the comments in the link above, Ubuntu 14.10 and other more recent VMs require different command line options.  Here's the example given that worked for me, inside a VM on OSX!

> $ docker run --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host firefox

Getting this to work on OSX is a bit different.  See https://github.com/docker/docker/issues/8710#issuecomment-71113263 for making this work with `socat`.

#### Socat Example

On OSX we must use `socat`.  Here is the command:

    $ socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

## 32 vs. 64 bit

It appears that you can prefix commands with `linux32` to run in a 32-bit environment.

### Optimizing Docker Images

* http://www.centurylinklabs.com/optimizing-docker-images/

## Docker Commands

Command | Note
---- | ----
`docker images` | List all of the images.
`docker search` | Search for docker images.
`docker pull <username>/<repository>` | Download docker images.
`docker run <image name> <command>` | Run a command inside the docker container.
`docker ps -l` | List containers.
`docker run -i -t <container> /bin/bash` | Run an interactive shell.
`docker commit [options] Container [Repository[:TAG]]` | Create a new image from a container's changes.
`docker push` | Push container up to repository.

### Delete all containers, images

~~~~.sh
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
~~~~

