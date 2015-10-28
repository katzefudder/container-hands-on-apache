FROM ubuntu:15.04

RUN apt-get update
RUN apt-get -y install apache2 php5

WORKDIR /var/www/html

ADD scripts/startup.sh /tmp/startup.sh
CMD ["/tmp/startup.sh"]