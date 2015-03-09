FROM ubuntu:14.04

RUN apt-get update && apt-get install -y x11-utils x11-common x11vnc xvfb fluxbox

ADD IDV5.tar.bz2 /root

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN mkdir ~/.fluxbox/
RUN bash -c 'echo "xterm &" >> ~/.fluxbox/startup'
RUN bash -c 'echo "/root/IDV5/runIDV &" >> ~/.fluxbox/startup'
RUN bash -c 'echo "exec /usr/bin/fluxbox -log ~/.fluxbox/log" >> ~/.fluxbox/startup'
###
# Clean up permissions.
###

ENV HOME /root
WORKDIR /root
USER root
EXPOSE 5900
CMD ["x11vnc", "-forever", "-usepw", "-create"]
