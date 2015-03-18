# dockerfile-kcachegrind README

This directory contains the `Dockerfile` used to build a docker container which will run a VNC session in an `x11vnc` virtual framebuffer.  It will also run kcachegrind.

## Building the Docker Image

To build the docker image, you would run the following command from this directory:

> $ docker build -t vnc .

## Running the Docker Image

In order to run this docker image, we need to expose a port which will be mapped to `5900` on the container.  Note that the `5900` port is already exposed in the `Dockerfile`.  We need to specify the port mapping when invoking `docker run`.  

Invoke `docker run` in one of the following fashions:

Invocation | Note
----|----
$ docker run -p 5900 | Map 5900 to a random port on the host.
$ docker run -p 5900:5901 | Map 5900 on container to 5901 on host.

You can see how ports are mapped via either `docker ps` or `docker port`, e.g.

> $ docker ps

or 

> $ docker port [container name]
