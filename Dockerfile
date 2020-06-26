FROM alpine:3.12

RUN apk --no-cache add curl git

# Install Helm
RUN curl -Lo helm-v3.1.2-linux-amd64.tar.gz https://get.helm.sh/helm-v3.1.2-linux-amd64.tar.gz && \
    tar -zxvf helm-v3.1.2-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm helm-v3.1.2-linux-amd64.tar.gz && \
    rm -rf linux-amd64 && \
    helm version

# Install helm-gcs plugin
RUN helm plugin install https://github.com/hayorov/helm-gcs.git --version 0.3.5
