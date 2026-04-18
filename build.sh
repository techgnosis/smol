#! /usr/bin/env bash

set euo -pipefail

podman image rm codingagent:1
podman build -t codingagent:1 .
