FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
