FROM alpine:3.22

WORKDIR /app

RUN apk --no-cache add dante-server wireguard-tools curl iptables

ADD entrypoint.sh /app/
ADD sockd.conf /etc/sockd.conf

VOLUME [ "/configdir" ]

ENTRYPOINT ["/app/entrypoint.sh"]

EXPOSE 1080
