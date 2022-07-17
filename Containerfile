FROM busybox:1.35.0@sha256:0d1d11dbad88f301fe745cf1b3fca8ee44ff5cf1c1be721f36b22bec592d9966

MAINTAINER Armin Jöllenbeck <armin@joellenbeck.net>

WORKDIR /home/project

COPY public public
