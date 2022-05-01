# sample dockerfile for testing call-docker-build.yaml
FROM alpine:edge

RUN apk add --no-cache curl

WORKDIR /test

COPY . .

ENTRYPOINT ["curl"]

CMD ["--help"]