FROM ubuntu:14.04

RUN apt-get update  
RUN apt-get install -y x11-utils x11-common x11vnc xvfb fluxbox man xinit nano



ADD IDV5.tar.bz2 /root

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

RUN mkdir ~/.fluxbox/
RUN bash -c 'echo "xterm &" >> ~/.fluxbox/startup'
RUN echo "/usr/bin/fluxbox -log ~/.fluxbox/log &" >> ~/.fluxbox/startup
RUN bash -c 'echo "/root/IDV5/runIDV && shutdown -h now" >> ~/.fluxbox/startup'


###
# Create a .xinitrc file.
#
# The environmental variable APORT = 5901 by default but can be
# overridden when invoking 'docker run', e.g.
#   $ docker run -e APORT=4435
###
RUN echo '/usr/bin/x11vnc -usepw -display :1 -autoport $APORT -forever &' >> /root/.xinitrc
RUN echo "/usr/bin/startfluxbox" >> /root/.xinitrc

ENV HOME /root
ENV APORT 5901
WORKDIR /root
USER root
EXPOSE 5901
CMD ["xinit", "--", "/usr/bin/Xvfb", ":1", "-screen", "0", "1024x768x24"]
