#!/usr/bin/env bash

set -eo pipefail

# Function to show an informational message
function msg() {
    echo -e "\e[1;32m$@\e[0m"
}

# Don't touch repo if running on CI
repo_flag="--shallow-clone" || repo_flag="--no-update"

# Build LLVM
msg "Building LLVM..."
./build-llvm.py \
	--clang-vendor "Pandora" \
	--branch "release/15.x" \
	--targets "ARM;AArch64;X86" \
	--build-type "MinSizeRel" \
	"$repo_flag" \
#	--pgo kernel-defconfig \
	--bolt --assertions \
	--lto thin

