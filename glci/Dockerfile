# Build with 'docker build -t YOUR_TAGNAME --build-arg PHP_VERSION=8.1-cli-alpine --build-arg COMPOSER_VERSION=2.1.14 .'
ARG PHP_VERSION=8.0-cli-alpine
ARG COMPOSER_VERSION=2.1

FROM composer:$COMPOSER_VERSION AS composer
FROM php:$PHP_VERSION

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache autoconf pkgconf musl-dev make gcc zlib zlib-dev libpng libpng-dev libzip-dev icu icu-libs icu-dev nodejs yarn bash git ghostscript \
	&& composer self-update \
	&& pecl install pcov \
	&& echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini \
	&& echo "memory_limit=256M" > /usr/local/etc/php/conf.d/memory_limit.ini \
	&& docker-php-ext-install gd intl zip \
	&& apk del zlib-dev libpng-dev icu-dev autoconf pkgconf musl-dev make gcc

WORKDIR /app
