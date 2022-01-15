FROM alpine:edge

RUN apk add --no-cache curl

ENTRYPOINT ["curl"]

CMD ["--help"]