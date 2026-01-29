FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    nano \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app


CMD ["bash"]
