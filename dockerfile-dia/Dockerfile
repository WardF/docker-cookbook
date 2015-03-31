#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####

FROM ubuntu:utopic
USER root
ENV HOME /root
WORKDIR /root

RUN apt-get update
RUN apt-get -y upgrade

###
# Install some basics.
###

RUN apt-get install -y man nano
RUN apt-get install -y x11-utils x11-common
RUN apt-get install -y dia

###
# Create a usage document
###

RUN echo 'USAGE on OSX' > ~/USAGE.md
RUN echo '' >> ~/USAGE.md
RUN echo 'First, start socat:' >> ~/USAGE.md
RUN echo '' >> ~/USAGE.md
RUN echo '    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"' >> ~/USAGE.md
RUN echo '' >> ~/USAGE.md
RUN echo 'Launching image on OSX via boot2docker:' >> ~/USAGE.md
RUN echo '' >> ~/USAGE.md
RUN echo '    docker run --rm -e DISPLAY=$(HOST IP):0 -v $(pwd):/root/diagrams <image name>' >> ~/USAGE.md
RUN echo '' >> ~/USAGE.md
RUN echo 'NOTE: If using on OSX or Windows via boot2docker, $(pwd) must be a subdirectory of $HOME!' >> ~/USAGE.md
RUN echo '' >> ~/USAGE.md

RUN mkdir -p /root/.local/share

###
# Copy over the utility run script so that we can
# mount a shared volume and copy it out to working dir,
# if that is easier.
###

ADD run_dia.sh /root

##
# Run dia on launch.
##
CMD /usr/bin/dia