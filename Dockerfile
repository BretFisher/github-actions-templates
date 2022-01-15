FROM alpine:edge

RUN apk add --no-cache curl

COPY . .

ENTRYPOINT ["curl"]

CMD ["--help"]