FROM murznn/fpm-nginx:latest

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions imagick bcmath

USER www-data

ENV PATH /var/www/html/vendor/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /var/www/html

COPY ./config/nginx.conf /etc/nginx/nginx.conf
COPY ./config/nginx-site.conf /etc/nginx/conf.d/default.conf
COPY ./config/php.ini /usr/local/etc/php/conf.d/zz_site.ini

USER root
