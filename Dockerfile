FROM alpine:3.14
RUN apk --no-cache add shfmt=3.3.0-r2
COPY lint /usr/local/bin/lint
COPY format /usr/local/bin/format
WORKDIR /code
CMD ["lint"]