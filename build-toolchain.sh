#!/usr/bin/env bash

set -eo pipefail

# Function to show an informational message
function msg() {
    echo -e "\e[1;32m$@\e[0m"
}

# Don't touch repo if running on CI
[ -z "$GH_RUN_ID" ] && repo_flag="--shallow-clone" || repo_flag="--no-update"

# Build LLVM
msg "Building LLVM..."
./build-llvm.py \
	--clang-vendor "PandoraMTK" \
	--targets "ARM;AArch64;X86" \
	"$repo_flag" \
	--pgo kernel-defconfig \
	--lto thin
