FROM php:5.6-fpm
RUN apt-get update && apt-get install -y libmemcached11 libmemcachedutil2 build-essential libmemcached-dev libz-dev
RUN pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN pecl install imagick \
#    && docker-php-ext-install mysql \
    && docker-php-ext-install mysqli
RUN apt-get update && apt-get install -y procps
RUN docker-php-ext-enable imagick
RUN docker-php-ext-install sockets
# COPY zz_docker-56.conf /usr/local/etc/php-fpm.d/zz-docker.conf
RUN chmod 644 /usr/local/etc/php-fpm.d/zz-docker.conf
RUN chown -R www-data:www-data /var/www/html
#RUN ls -al /usr/local/etc/php/
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
