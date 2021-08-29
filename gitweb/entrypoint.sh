#!/usr/bin/env sh

if [ -z "$1" ]; then
    # Start gitweb server on port 1234
    git instaweb --httpd=webrick

    # Override config file with example
    cp gitweb_config-example.perl ./.git/gitweb/gitweb_config.perl

    tail -F .git/gitweb/access.log
else
    exec "$@"
fi
