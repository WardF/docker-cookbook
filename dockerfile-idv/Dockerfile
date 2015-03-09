FROM ubuntu:14.04

RUN apt-get update && apt-get install -y x11-utils x11-common x11vnc xvfb fluxbox man xinit nano

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
RUN echo "/usr/bin/fluxbox -log ~/.fluxbox/log" >> ~/.fluxbox/startup

###
# Create a .xinitrc file.
###

RUN echo "/usr/bin/startfluxbox" > /root/.xinitrc

###
# Shell script which runs xinit (to take advantage of .xinitrc file),
# connects x11vnc to it.
###

RUN echo "#!/bin/bash" > /root/startup.sh
RUN echo "nohup xinit -- /usr/bin/Xvfb :1 -screen 0 1024x768x24 &" >> /root/startup.sh
RUN echo "sleep 5" >> /root/startup.sh
RUN echo "x11vnc -usepw -display :1" >> /root/startup.sh

RUN chmod 755 /root/startup.sh


ENV HOME /root
WORKDIR /root
USER root
EXPOSE 5900
#CMD ["x11vnc", "-forever", "-usepw", "-create"]
CMD ["bash", "/root/startup.sh"]