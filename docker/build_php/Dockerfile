FROM php:7.1.19-apache

RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
    rm -rf /var/lib/apt/lists/*

#install xdebug via pecl
RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug
#configure xdebug -> remote debug für alle (SICHER ist das natürlich nicht)
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_connect_back=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
#install mysqli
RUN docker-php-ext-install mysqli

RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev

#mod_ssl installieren und aktivieren
RUN apt-get install -y openssl ssl-cert
RUN a2enmod ssl

#mod_rewrite aktivieren
RUN a2enmod rewrite

#dev.conf installieren
COPY dev.conf /etc/apache2/sites-enabled/dev.conf

#ssl certificate kopieren, Einbindung erfolgt in dev.conf (s.o.)
COPY server.crt /etc/apache2/ssl/
COPY server.key /etc/apache2/ssl/

#Create group www-host with gid=1000 and add www-data to it --> write rights on bind mount
RUN groupadd -g 1000 www-host && usermod -a -G www-host www-data
