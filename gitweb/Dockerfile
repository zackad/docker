FROM ruby:2.6-alpine

RUN apk add --no-cache git git-gitweb perl-cgi \
    && mkdir -p /srv/gitweb/repo \
    && cd /srv/gitweb \
    && git init

WORKDIR /srv/gitweb

COPY entrypoint.sh /srv/gitweb/entrypoint.sh
COPY gitweb_config-example.perl /srv/gitweb/gitweb_config-example.perl

CMD './entrypoint.sh'
