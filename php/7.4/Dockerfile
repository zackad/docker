FROM composer:2 AS composer

FROM php:7.4-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk --no-cache add zlib zlib-dev libpng libpng-dev && \
    docker-php-ext-install gd && \
    apk del zlib-dev libpng-dev

WORKDIR /app
