FROM centos:7

MAINTAINER gonzalo@linux.com.uy

#LABEL Jboss app centos-based 

RUN yum install -y epel-release && \
    yum install -y vim && \
    yum install -y java-1.7.0-openjdk.x86_64 && \
    yum -y update


RUN useradd jboss && \
    mkdir /opt/jboss-7

COPY ./wildfly-9.0.0.Final /opt/jboss-7/wildfly-9.0.0.Final
COPY ./example.war /opt/jboss-7/wildfly-9.0.0.Final/standalone/deployments/example.war

RUN chown -R jboss: /opt/jboss-7
#RUN chgrp -R 0 /opt/jboss-7 && \
#    chmod -R g=u /opt/jboss-7
    

EXPOSE 8080

USER jboss

CMD [ "/opt/jboss-7/wildfly-9.0.0.Final/bin/standalone.sh", "-b", "0.0.0.0"]

     
    
