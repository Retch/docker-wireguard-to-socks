#!/bin/sh

set -e

oldip=$(curl -s ifconfig.me)

ifname=$(basename $(ls -1 /configdir/*.conf | head -1) .conf)

cp /configdir/${ifname}.conf /etc/wireguard/wg99.conf

echo "Using wireguard config ${ifname}"
wg-quick up wg99

echo "Regular IP: ${oldip}"

sleep 3 && newip=$(curl -s ifconfig.me) && \
  echo "Wireguard IP: ${newip}" && \
  sockd -f /etc/sockd.conf
