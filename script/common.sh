#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

readonly DOCKER=$(which docker)

readonly OMNI_DOCKER_IMAGE_NAMESPACE="hongjianghuang"
readonly ROOT="$(dirname "${BASH_SOURCE}")/.."
readonly LANG_ROOT="${ROOT}"

function omni::util::date() {
    date "+%Y%m%d"
}

function omni::util::git_revision() {
    local -r head_commit=$(git rev-parse --short HEAD)
    local -r suffix=$(test -n "$(git status --porcelain)" && echo "-dev" || echo '')
    echo "${head_commit}${suffix}"
}

# 创建一个 语言 模板
#
# $1 - 语言 名称
function omni::lang::g() {
    local -r lang_name=${1:-""}
    if [[ -z "$lang_name" ]]; then
        echo "Usage: g-service.sh {LANG_NAME}"
        exit 1
    fi

    local -r lang_root="${LANG_ROOT}/${lang_name}"
    mkdir -p "$lang_root"
    touch "$lang_root/.gitignore"
    touch "$lang_root/Dockerfile"
}

# 构建一个 语言 的 dockerfile
#
# $1 - 语言 名称
function omni::lang::docker::b() {
    local -r lang_name=${1:-""}
    if [[ -z "$lang_name" ]]; then
        echo "Usage: b-service-docker.sh {LANG_NAME}"
        exit 1
    fi

    local -r dockerfile="${LANG_ROOT}/${lang_name}/Dockerfile"
    local -r image_name="${OMNI_DOCKER_IMAGE_NAMESPACE}/${lang_name}"
    local -r image_tag="${image_name}"
    local -r dockerctx="${LANG_ROOT}/${lang_name}"
    if [[ -e "$dockerfile" ]]; then
        "$DOCKER" build \
            -f "$dockerfile" \
            -t "${image_tag}" \
            "${dockerctx}"
        "$DOCKER" tag "${image_tag}" "${OMNI_DOCKER_IMAGE_NAMESPACE}/${image_tag}"
    else
        echo "${dockerfile} is not exist"
        exit 2
    fi
}
