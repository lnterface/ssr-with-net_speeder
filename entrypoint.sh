#!/bin/bash

PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo $(date)
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this container via SSH using:"
echo ""
echo "    ssh -p <port> root@<host>"
echo "and enter the root password '$PASS' when prompted"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"

nohup /usr/sbin/sshd -D &
nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
python /root/ssr/shadowsocks/server.py "$@"
