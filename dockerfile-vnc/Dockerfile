#####
# Common stuff goes at the front,
# so that we can take advantage of the
# shared layers that docker provides.
#####

FROM ubuntu:utopic

RUN apt-get update
RUN apt-get -y upgrade

###
# Install some basics.
###

RUN apt-get install -y man nano
RUN apt-get install -y x11-utils x11-common x11vnc xvfb xinit
RUN apt-get install -y fluxbox


###
# Set up a non-root user account.
###

RUN useradd -ms /bin/bash dockuser
RUN echo "dockuser:docker" | chpasswd
RUN adduser dockuser sudo

USER dockuser
ENV HOME /home/dockuser
WORKDIR /home/dockuser

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd

###
# Create a .xinitrc file.
#
# The environmental variable APORT = 5901 by default but can be
# overridden when invoking 'docker run', e.g.
#   $ docker run -e APORT=4435
###
RUN echo '/usr/bin/x11vnc -usepw -display :1 -autoport $APORT -forever &' >> ~/.xinitrc
RUN echo "/usr/bin/startfluxbox" >> ~/.xinitrc


###
# Configure fluxbox.
###

RUN mkdir ~/.fluxbox/
RUN bash -c 'echo "xterm &" >> ~/.fluxbox/startup'
RUN echo "/usr/bin/fluxbox -log ~/.fluxbox/log " >> ~/.fluxbox/startup

###
# Install additional packages.
###

USER root
RUN apt-get install -y emacs git wget

###
# Install google-chrome-stable as a separate command.
###
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt-get update
RUN apt-get install -y google-chrome-stable

USER dockuser
RUN echo 'alias google-chrome="google-chrome --no-sandbox"' >> ~/.bashrc

ENV APORT 5901
EXPOSE 5901
CMD ["xinit", "--", "/usr/bin/Xvfb", ":1", "-screen", "0", "1024x768x24"]
