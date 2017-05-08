FROM       centos:latest
MAINTAINER lnterface "https://github.com/lnterface/ssr-with-net_speeder"

RUN yum update -y && \
    yum install -y openssh-server pwgen wget python python-m2crypto libnet libpcap libnet-devel libpcap-devel git gcc epel-release && \
    yum install -y libsodium && \
    yum clean all
    
RUN mkdir /var/run/sshd
RUN sed -ri 's/^#PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && \
    ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''
EXPOSE 22

RUN git clone -b manyuser https://github.com/breakwa11/shadowsocks.git /root/ssr

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
