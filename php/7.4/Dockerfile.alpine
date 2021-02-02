FROM composer:2 AS composer

FROM php:7.4-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk --no-cache add zlib zlib-dev libpng libpng-dev icu icu-libs icu-dev && \
    docker-php-ext-install gd intl && \
    apk del zlib-dev libpng-dev icu-dev

WORKDIR /app
