# SSR-with-net_speeder for docker

Quit start:

    docker run -d -p 8388:8388/tcp -p 8388:8388/udp lnterface/ssr-with-net_speeder -s 0.0.0.0 -p 8388 -k pass -m chacha20-ietf -o tls1.2_ticket_auth_compatible -P auth_sha1_v4_compatible

In default,the root passwd is random.If you want to use a preset password instead of a random generated one, you can set the environment variable ROOT_PASS to your specific password when running the container:

    docker run -d -p 8388:8388/tcp -p 8388:8388/udp -e ROOT_PASS="mypass" lnterface/ssr-with-net_speeder -s 0.0.0.0 -p 8388 -k pass -m chacha20-ietf -o tls1.2_ticket_auth_compatible -P auth_sha1_v4_compatible

