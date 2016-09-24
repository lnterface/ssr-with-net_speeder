#!/bin/bash

nohup /usr/sbin/sshd -D &
nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
python /root/ssr/shadowsocks/server.py "$@"
