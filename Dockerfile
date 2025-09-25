FROM alpine:3.22

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --no-cache add 3proxy wireguard-tools curl iptables
ADD entrypoint.sh /usr/local/bin/

VOLUME [ "/etc/wireguard" ]

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 1080
