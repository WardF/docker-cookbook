#####
# Dockerfile for creating a custom thredds service
# that will perform aggregation for a directory mapped
# from the host to the docker image.
#####

FROM ubuntu:14.04
USER root
ENV HOME /root
WORKDIR /root

###
# Bring the system up to speed.
###

RUN apt-get update

RUN apt-get install -y default-jdk
RUN apt-get install -y wget

###
# Pre-download files so that we don't have to repeat
# this with downstream changes.
###

ENV TC_VERSION 8.0.26
ENV TC_NAME apache-tomcat-${TC_VERSION}
ENV TC_FILENAME ${TC_NAME}.tar.gz

RUN wget http://apache.mirrors.tds.net/tomcat/tomcat-8/v${TC_VERSION}/bin/${TC_FILENAME}
RUN wget ftp://ftp.unidata.ucar.edu/pub/thredds/4.3/current/thredds.war

###
# Download/install tomcat
###

RUN mv ${TC_FILENAME} /usr/local
RUN cd /usr/local && tar -zxf ${TC_FILENAME}


###
# Copy over configuration files.
###

# Tomcat setenv.sh
COPY setenv.sh /usr/local/${TC_NAME}/bin/
RUN chmod 755 /usr/local/${TC_NAME}/bin/setenv.sh

# Tomcat users configuration.
COPY tomcat-users.xml /usr/local/${TC_NAME}/conf/

# Set up the tomcat user
RUN useradd tomcat
RUN chown -R tomcat /usr/local/${TC_NAME}

# Tomcat init script.
COPY tomcat /etc/init.d/
RUN chmod 755 /etc/init.d/tomcat
RUN update-rc.d tomcat defaults

# Start Tomcat so that it can install thredds.
RUN /etc/init.d/tomcat start

###
# Install thredds.
###

RUN chown tomcat thredds.war
RUN mv thredds.war /usr/local/${TC_NAME}/webapps

RUN mkdir -p /usr/local/${TC_NAME}/content
COPY thredds.tar.bz2 /usr/local/${TC_NAME}/content/
RUN cd /usr/local/${TC_NAME}/content && tar -jxf thredds.tar.bz2

###
# Final Items
###
COPY bootstrap_tomcat.sh /root/
COPY Dockerfile /root/
EXPOSE 8080

CMD /root/bootstrap_tomcat.sh
