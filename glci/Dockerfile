# Build with 'docker build -t YOUR_TAGNAME --build-args PHP_VERSION=your-selected-php-version-image .'
ARG PHP_VERSION=php:8.0-cli-alpine

FROM composer:2 AS composer
FROM $PHP_VERSION

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache autoconf pkgconf musl-dev make gcc zlib zlib-dev libpng libpng-dev libzip-dev icu icu-libs icu-dev nodejs yarn bash git ghostscript \
	&& pecl install pcov \
	&& echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini \
	&& docker-php-ext-install gd intl zip \
	&& apk del zlib-dev libpng-dev icu-dev autoconf pkgconf musl-dev make gcc

WORKDIR /app
