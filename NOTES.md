# Docker Notes

* You *start* a container by running a process in it.
* Docker stops when the command/process exits.

> Note that even though the container stops right after a command completes, the changes are not forgotten.

## Delete all containers, images

~~~~.sh
#!/bin/bash
# Delete all containers
docker rm $(docker ps -a -q)
# Delete all images
docker rmi $(docker images -q)
~~~~

## Docker Commands

Command | Note
---- | ----
`docker search` | Search for docker images.
`docker pull <username>/<repository>` | Download docker images.
`docker run <image name> <command>` | Run a command inside the docker container.
`docker ps -l` | List containers.
`docker push` | Push container up to repository.
`docker run -i -t <container> /bin/bash` | Run an interactive shell.