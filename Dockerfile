FROM realorko/hb-cli:latest

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/mikefarah/yq/releases/download/3.2.1/yq_linux_amd64 && mv yq_linux_amd64 /usr/bin/yq && chmod +x /usr/bin/yq

RUN wget https://github.com/concourse/concourse/releases/download/v5.8.0/fly-5.8.0-linux-amd64.tgz && \
    tar xf fly*.tgz -C /usr/bin/ && \
    chmod +x /usr/bin/fly

COPY validate.sh /validate.sh

ENTRYPOINT [ "/validate.sh" ]