FROM ubuntu:14.04

RUN apt-get update && apt-get install -y x11-utils x11-common x11vnc xvfb firefox fluxbox

##
# Replace 1000 with your user / group id
###
#RUN export uid=1000 gid=1000 && \
#    mkdir -p /home/idvuser && \
#    echo "idvuser:x:${uid}:${gid}:IDVUser,,,:/home/idvuser:/bin/bash" >> /etc/passwd && \
#    echo "idvuser:x:${uid}:" >> /etc/group && \
#    echo "idvuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/idvuser && \
#    chmod 0440 /etc/sudoers.d/idvuser && \
#    chown ${uid}:${gid} -R /home/idvuser
##
# Move the IDV over.
##
#ADD IDV5.tar.bz2 /home/idvuser
ADD IDV5.tar.bz2 /root

###
# Configure vnc, xvfb.
# Taken from https://docs.docker.com/reference/builder/#entrypoint
###

RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
#RUN bash -c 'echo "fluxbox" >> ~/.bashrc'
#RUN bash -c 'echo "exec startfluxbox" >> ~/.bashrc'
#RUN bash -c 'echo "exec startfluxbox" >> ~/.xinitrc'

RUN mkdir ~/.fluxbox/
RUN bash -c 'echo "xterm &" >> ~/.fluxbox/startup'
RUN bash -c 'echo "/root/IDV5/runIDV &" >> ~/.fluxbox/startup'
RUN bash -c 'echo "exec /usr/bin/fluxbox -log ~/.fluxbox/log" >> ~/.fluxbox/startup'
###
# Clean up permissions.
###
#RUN chown -R idvuser:idvuser /home/idvuser

#USER idvuser
#ENV HOME /home/idvuser
#WORKDIR /home/idvuser
ENV HOME /root
WORKDIR /root
USER root
EXPOSE 5900
CMD ["x11vnc", "-forever", "-usepw", "-create"]
