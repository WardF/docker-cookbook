# dockerfile-cdash README

A docker-ized CDash instance.  See http://www.cdash.org for information regarding cdash.

## Usage

    $ docker run -d -it -p 80:80 -v $(pwd)/data:/var/lib/mysql cdash
    
