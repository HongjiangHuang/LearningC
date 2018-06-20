#!/bin/bash

# 创建一个 service 模板

set -o errexit
set -o nounset
set -o pipefail

source "$(dirname "${BASH_SOURCE}")/common.sh"

echo -n "lang name: "
read -r lang_name
omni::lang::g "$lang_name"
