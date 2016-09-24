# SSR-with-net_speeder for docker

Quit start:

docker run -d -p 8388:8388/tcp -p 8388:8388/udp lnterface/ssr-with-net_speeder -s 0.0.0.0 -p 8388 -k pass -m chacha20-ietf -o tls1.2_ticket_auth_compatible -P auth_sha1_v4_compatible
