#!/usr/bin/env bash

shopt -s nullglob
set -euo pipefail

if [ -n "$(echo patches/*.patch)" ]; then
    pushd llvm-project
    git apply -3 ../patches/*.patch
    popd
fi
