FROM ubuntu:15.04

RUN apt-get update && apt-get -y install apache2 php5 supervisor

# install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN cat /etc/apache2/envvars
CMD /bin/bash -c "source /etc/apache2/envvars" && /usr/sbin/apache2 -DFOREGROUND

ADD scripts/vhost.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite vhost.conf

WORKDIR /var/www

ADD scripts/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]