FROM centos:7

MAINTAINER Willian Cardoso <wvcardoso@gmail.com>

LABEL Vendor="CentOS" License=GPLv2 Version=2.4.6-40

ENV VERSION_WILDFLY 10.1.0.Final

RUN yum -y update && \
    yum -y install wget && \
    yum -y install java-1.8.0-openjdk && \
    yum clean all

RUN wget http://download.jboss.org/wildfly/${VERSION_WILDFLY}/wildfly-${VERSION_WILDFLY}.tar.gz -O /tmp/wildfly-${VERSION_WILDFLY}.tar.gz 
RUN cd /tmp && \
    tar -zxf /tmp/wildfly-${VERSION_WILDFLY}.tar.gz && \
    mv /tmp/wildfly-${VERSION_WILDFLY} /opt/wildfly && \
    rm -rf /tmp/wildfly*

COPY wildfly/ /opt/wildfly/

RUN /opt/wildfly/bin/add-user.sh admin admin@123 --silent

EXPOSE 8080

CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
