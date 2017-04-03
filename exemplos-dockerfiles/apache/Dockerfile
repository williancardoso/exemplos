FROM centos:7

MAINTAINER Willian Cardoso <wvcardoso@gmail.com>

LABEL Vendor="CentOS" License=GPLv2 Version=2.4.6-40

RUN yum -y update && \
    yum -y install httpd && \
    yum -y install mod_ssl && \
    yum clean all

RUN echo "teste.hacklab.localdomain" > /etc/hostname
RUN echo "teste.hacklab.localdomain" >> /etc/hosts

COPY httpd.conf /etc/httpd/conf/httpd.conf
COPY ssl.conf /etc/httpd/conf.d/ssl.conf
COPY vhost.conf /etc/httpd/conf.d/vhost.conf

COPY apache.crt /etc/httpd/conf.d/apache.crt
COPY apache.key /etc/httpd/conf.d/apache.key

EXPOSE 80 443

RUN rm -rf /run/httpd/* 
RUN rm -rf /tmp/httpd*

CMD ["/usr/sbin/apachectl","-D","FOREGROUND"]
