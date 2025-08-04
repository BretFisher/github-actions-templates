# sample dockerfile for testing call-docker-build.yaml
FROM alpine:3.22.1

RUN apk add --no-cache curl

WORKDIR /test

COPY . .

ENTRYPOINT ["curl"]

CMD ["--help"]
