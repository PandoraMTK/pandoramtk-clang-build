#!/usr/bin/env bash

set -eo pipefail

# Function to show an informational message
function msg() {
    echo -e "\e[1;32m$@\e[0m"
}

# Build binutils
msg "Building binutils..."
./build-binutils.py --targets arm aarch64 x86_64