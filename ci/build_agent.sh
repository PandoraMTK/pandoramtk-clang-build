#!/usr/bin/env bash

shopt -s nullglob
set -euo pipefail

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"

# Clone LLVM and apply fixup patches *before* building
git clone --depth 1 "https://github.com/llvm/llvm-project"
if [ -n "$(echo patches/*.patch)" ]; then
    pushd llvm-project
    git apply -3 ../patches/*.patch
    popd
fi
./build-toolchain.sh
./upload-build.sh
