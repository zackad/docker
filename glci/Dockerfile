# Build with 'docker build -t YOUR_TAGNAME --build-arg PHP_VERSION=8.1-cli-alpine --build-arg COMPOSER_VERSION=2.1.14 .'
ARG PHP_VERSION=8.1-cli-alpine
ARG COMPOSER_VERSION=2.3

FROM composer:$COMPOSER_VERSION AS composer
FROM php:$PHP_VERSION

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN apk add --no-cache \
	bash \
	ghostscript \
	git \
	gnupg \
	icu \
	icu-libs \
	libpng \
	nodejs \
	yarn \
	zlib \
	autoconf \
	gcc \
	make \
	musl-dev \
	icu-dev \
	libpng-dev \
	libzip-dev \
	pkgconf \
	zlib-dev \
	&& composer self-update \
	&& pecl install pcov \
	&& echo "extension=pcov.so" > /usr/local/etc/php/conf.d/pcov.ini \
	&& echo "memory_limit=256M" > /usr/local/etc/php/conf.d/memory_limit.ini \
	&& docker-php-ext-install gd intl zip \
	&& apk del zlib-dev libpng-dev icu-dev autoconf pkgconf musl-dev make gcc \
	&& wget -O phive.phar "https://phar.io/releases/phive.phar" \
    && wget -O phive.phar.asc "https://phar.io/releases/phive.phar.asc" \
    && gpg --keyserver hkps://keys.openpgp.org --recv-keys 0x6AF725270AB81E04D79442549D8A98B29B2D5D79 \
    && gpg --verify phive.phar.asc phive.phar \
    && rm phive.phar.asc \
    && chmod +x phive.phar \
    && mv phive.phar /usr/local/bin/phive

WORKDIR /app
