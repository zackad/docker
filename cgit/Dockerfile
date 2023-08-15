FROM alpine AS builder

WORKDIR /tmp

ENV NO_REGEX=NeedStartEnd
ENV NO_GETTEXT=YesPlease
ENV LUA_PKGCONFIG=luajit

RUN apk add build-base git curl openssl-dev zlib-dev luajit-dev
RUN git clone https://git.zx2c4.com/cgit
WORKDIR /tmp/cgit
RUN make get-git
RUN make -j $(nproc)

FROM alpine

COPY --from=builder /tmp/cgit/cgit /srv/cgit/cgit
COPY --from=builder /tmp/cgit/cgit.css /srv/cgit/cgit.css
COPY --from=builder /tmp/cgit/cgit.js /srv/cgit/cgit.js
COPY --from=builder /tmp/cgit/cgit.png /srv/cgit/cgit.png
COPY --from=builder /tmp/cgit/favicon.ico /srv/cgit/favicon.ico
COPY --from=builder /tmp/cgit/robots.txt /srv/cgit/robots.txt
COPY --from=builder /tmp/cgit/filters /srv/cgit/filters

# TODO: add default configuration
# TODO: install missing runtime depedencies
