FROM php:7.4-fpm
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN pecl install imagick
RUN docker-php-ext-enable imagick
RUN apt-get update && apt-get install -y libmemcached11 libmemcachedutil2 build-essential libmemcached-dev libz-dev
RUN pecl install memcached
RUN docker-php-ext-enable memcached
RUN docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y procps
RUN docker-php-ext-install sockets
#RUN set -x \
#    && deluser www-data
# RUN adduser -u 500 -S -G www-data www-data
# RUN adduser --system --group www-data
# COPY zz_docker-74.conf /usr/local/etc/php-fpm.d/zz-docker.conf
RUN chmod 644 /usr/local/etc/php-fpm.d/zz-docker.conf
RUN chown -R www-data:www-data /var/www/html
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
