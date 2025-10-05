FROM alpine:latest

ARG KUBECTL_VERSION=v1.33.1

RUN apk upgrade --no-cache && \
    apk update --no-cache && \
    apk add --no-cache --update \
    openssl \
    kubectl \
    curl \
    ca-certificates

RUN openssl version && kubectl version --client

CMD ["/bin/sh"]
