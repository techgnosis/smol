#! /usr/bin/env zsh

podman run \
-it \
--rm \
-v ~/.gitconfig:/home/alpaca/.gitconfig \
-v ~/.ssh:/home/alpaca/.ssh:ro \
-v $(pwd):/workspace \
--workdir /workspace \
codingagent:1 bash
