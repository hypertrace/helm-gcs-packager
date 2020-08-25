FROM alpine:3.12

# Use latest recommended version here
ARG HELM_VERSION=3.3.0

WORKDIR /usr/local/bin

# Install Helm, helm-gcs plugin and git
RUN apk --update --no-cache add curl git && \
  curl -sSL https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz | tar xz \
    --strip=1 linux-amd64/helm && \
  helm plugin install https://github.com/hayorov/helm-gcs.git --version 0.3.6 && \
  apk del curl --purge && \
  rm -rf ~/.cache ~/.local/share/helm/plugins/helm-gcs.git/.git && \
  helm version && helm plugin list
