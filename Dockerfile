FROM alpine:latest

RUN apk add --no-cache wireguard-tools iproute2

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE ${PORT:-51820}/udp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]