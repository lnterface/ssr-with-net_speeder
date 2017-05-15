FROM alpine:3.5
MAINTAINER lnterface <https://github.com/lnterface/ssr-with-net_speeder>

RUN set -ex \
    && if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories ;fi \
    && apk --update add --no-cache bash wget libsodium py-pip libnet-dev libpcap-dev tzdata musl-dev openssh pwgen apache2 \
    && cp -r -f /usr/share/zoneinfo/Hongkong /etc/localtime \
    && pip --no-cache-dir install https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip

RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && \
    sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    mkdir -p /run/apache2 && \
    chown -R apache:apache /run/apache2

COPY net_speeder /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/bin/net_speeder && \
    chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
