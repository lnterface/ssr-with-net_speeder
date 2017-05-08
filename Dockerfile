# shadowsocksr-net-speeder 
FROM ubuntu:16.04
MAINTAINER lnterface [https://github.com/lnterface/ssr-with-net_speeder]
RUN apt-get update && \
    apt-get install -y pwgen wget python python-m2crypto libnet1-dev libpcap0.8-dev libsodium-dev git gcc openssh-server && \
    apt-get clean all

#ssh
RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
EXPOSE 22

#get shadowsocksr
RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /root/ssr

#install net-speeder
RUN git clone https://github.com/snooda/net-speeder.git /net-speeder
WORKDIR /net-speeder
RUN sh build.sh
RUN mv net_speeder /usr/local/bin/

WORKDIR /
RUN rm -rf /net-speeder
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
