#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

docker run --rm --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data blang/latex:ubuntu make
