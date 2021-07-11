FROM composer:2 AS composer

FROM php:7.4-cli-alpine3.12

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache autoconf pkgconf musl-dev make gcc zlib zlib-dev libpng libpng-dev icu icu-libs icu-dev nodejs yarn bash git ghostscript \
    && pecl install pcov \
    && echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini \
    && docker-php-ext-install gd intl \
    && apk del zlib-dev libpng-dev icu-dev autoconf pkgconf musl-dev make gcc

WORKDIR /app
