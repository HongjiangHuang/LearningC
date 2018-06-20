#!/bin/bash

# 构建一个 语言 的 docker 镜像

set -o errexit
set -o nounset
set -o pipefail

source "$(dirname "${BASH_SOURCE}")/common.sh"

lang_name=${1:-""}
if [[ -z "$lang_name" ]]; then
    echo -n "lang name: "
    read -r lang_name
fi

omni::lang::docker::b "$lang_name"
