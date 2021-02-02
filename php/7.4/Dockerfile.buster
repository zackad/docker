FROM composer:2 AS composer

FROM php:7.4-cli-buster

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apt update \
    && apt install -y libzip-dev libicu-dev libpng-dev \
    && docker-php-ext-install intl gd zip exif \
    && pecl install pcov \
    && echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini \
    && apt remove -y libicu-dev \
    && apt autoremove -y \
    && rm -fr /var/lib/apt/lists/*

WORKDIR /app
