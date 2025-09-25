#!/bin/sh

set -e

DROUTE=$(ip route | grep default | awk '{print $3}')
HOMENET=192.168.0.0/16
HOMENET2=10.0.0.0/8
HOMENET3=172.16.0.0/12
ip route add $HOMENET3 via $DROUTE
ip route add $HOMENET2 via $DROUTE
ip route add $HOMENET via $DROUTE
iptables -I OUTPUT -d $HOMENET -j ACCEPT
iptables -A OUTPUT -d $HOMENET2 -j ACCEPT
iptables -A OUTPUT -d $HOMENET3 -j ACCEPT

oldip=$(curl -s ifconfig.me)

ifname=$(basename $(ls -1 /etc/wireguard/*.conf | head -1) .conf)

echo "wg-quick up {$ifname}"
wg-quick up /etc/wireguard/$ifname.conf

echo "Regular IP: ${oldip}"

