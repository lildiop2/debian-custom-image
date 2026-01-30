FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ca-certificates \
    openssh-server \
    curl \
    git \
    nano \
    bash \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Diretório exigido pelo sshd
RUN mkdir /var/run/sshd

# 🔐 Configurações básicas de segurança
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Define senha do root (troque depois!)
RUN echo "root:root" | chpasswd

# Expor porta SSH
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]

