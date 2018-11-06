FROM php:fpm-alpine
WORKDIR /var/www/html
COPY / /var/www/html/
RUN apk add --no-cache nginx \
    && mkdir /run/nginx \
    && chown -R www-data:www-data /var/www/html/ \
    && mv default.conf /etc/nginx/conf.d \
    && mv php.ini /usr/local/etc/php

EXPOSE 80 6800
CMD php-fpm & \
    nginx -g "daemon off;"
