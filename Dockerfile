FROM alpine:3.10

# https://aur.archlinux.org/packages/kubectl-bin/
ENV KUBECTL_VERSION="1.15.5"

# https://github.com/kubernetes/helm/releases
ENV HELM_VERSION="3.0.0"

# https://github.com/hypnoglow/helm-s3
ENV HELM_S3_PLUGIN_VERSION="0.8.0"

# Set some defaults
ENV AWS_DEFAULT_REGION="us-east-1"

COPY install.sh /opt/install.sh

RUN set -eux \
        && apk update \
        && apk --no-cache upgrade \
        && apk add --update bash ca-certificates git python jq gettext bash-completion \
        && chmod +x /opt/install.sh \
        && /opt/install.sh

CMD ["bash"]
