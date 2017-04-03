# A basic apache server. To use either add or bind mount content under /var/www
FROM nginx

MAINTAINER Willian Cardoso

RUN apt-get update && apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 80

CMD ["/usr/sbin/nginx", "-D", "FOREGROUND"]
