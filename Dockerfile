FROM alpine:3
ARG VERSION=3.5.0-r0
RUN apk --no-cache add shfmt=${VERSION}
COPY lint /usr/local/bin/lint
COPY format /usr/local/bin/format
COPY minify /usr/local/bin/minify
WORKDIR /code
CMD ["lint"]