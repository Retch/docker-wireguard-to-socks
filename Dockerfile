FROM alpine:3.22

RUN apk --no-cache add 3proxy wireguard-tools curl
ADD entrypoint.sh /usr/local/bin/

VOLUME [ "/etc/wireguard" ]

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 1080
