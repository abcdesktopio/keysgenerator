FROM debian:trixie-slim

RUN apt update && \
    apt upgrade -y && \
    apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl gnupg openssl && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.33/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.33/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg /etc/apt/sources.list.d/kubernetes.list && \
    apt update && \
    apt upgrade -y && \
    apt install --no-install-recommends kubectl && \
    apt purge curl gnupg -y && \
    apt autoremove -y
