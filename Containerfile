FROM alpine:3.23

RUN apk update && apk add curl bash git openssh go rust make python3 file

# Linux
# RUN adduser -D -u 1000 codingagent

# macOS
RUN adduser -D -u 501 -g 20 codingagent

USER codingagent
WORKDIR /home/codingagent/


ENV PATH="/home/codingagent/.local/bin:${PATH}"

RUN curl -fsSL https://claude.ai/install.sh | bash

# br does not have an aarch64 musl build so I have to rely on qemu in the podman machine
RUN wget https://github.com/Dicklesworthstone/beads_rust/releases/download/v0.1.41/br-v0.1.41-linux_musl_amd64.tar.gz
RUN tar xf br-v0.1.41-linux_musl_amd64.tar.gz
RUN mv br ~/.local/bin/
RUN rm br-v0.1.41-linux_musl_amd64.tar.gz


RUN wget https://github.com/openai/codex/releases/download/rust-v0.121.0/codex-aarch64-unknown-linux-musl.tar.gz
RUN tar xf codex-aarch64-unknown-linux-musl.tar.gz
RUN mv codex-aarch64-unknown-linux-musl ~/.local/bin/codex
RUN rm codex-aarch64-unknown-linux-musl.tar.gz

COPY codex.sh /home/codingagent/.local/bin/
COPY claude.sh /home/codingagent/.local/bin/
