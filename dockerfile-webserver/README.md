# Webserver

Docker image for a webserver docker container.  Used to run a temporary webserver.

## Usage

It is required to map the directory to `/www` in the container.

    $ docker run -it -P -v $(pwd)/html:/www wardf/webserver
    
