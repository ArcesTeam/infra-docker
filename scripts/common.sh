#!/bin/bash

#
# Copyright (c) 2025 ArcesTeam. All rights reserved.
# This project is licensed under the MIT License. See the LICENSE file for details.
# This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT License for more details.
#
#

set -euo pipefail

log_info() { echo -e "$(date +'%H:%M:%S') \033[1;32m[INFO]\033[0m] $*"; }
log_warn() { echo -e "$(date +'%H:%M:%S') \033[1;33m[WARN]\033[0m] $*"; }
log_error() { echo -e "$(date +'%H:%M:%S') \033[1;31m[ERROR]\033[0m] $*" >&2; }

read_version() {
    if [[ ! -f VERSION ]]; then
        log_error "VERSION file not found in $(pwd). Please create a VERSION file with the image version."
        return 1
    fi

    local version
    version=$(< VERSION)
    version="${version//[$'\t\r\n ']}"  # Trim whitespace

    [[ -z "$version" ]] && {
        log_error "VERSION file is empty. Please provide a valid version."
        return 1
    }

    echo "$version"
}

image_exists_remotely() {
    local tag="$1"

    if docker manifest inspect "$tag" &>/dev/null; then
        log_info "Docker image with tag $tag already exists. Skipping build."
        return 0
    fi

    return 1
}

get_tag() {
    local image_role="$1"
    local image_name="$2"
    local image_version="$3"

    echo "ghcr.io/arcesteam/infra-docker/$image_role/$image_name:$image_version"
}

build_and_push_image() {
    local image_role="$1"
    local image_name="$2"
    local image_version="$3"

    local sort_name="$image_name:$image_version"
    # shellcheck disable=SC2155
    local tag="$(get_tag "$image_role" "$image_name" "$image_version")"

    log_info "Building Docker image: $sort_name"

    docker build -t "$tag" \
        --build-arg "IMAGE_NAME=$image_name" \
        --build-arg "VERSION=$image_version" \
        --file "Dockerfile" \
        --progress=plain \
        .

    log_info "Docker image built successfully: $sort_name"

    log_info "Pushing Docker image: $sort_name"

    docker push "$tag"

    log_info "Docker image pushed successfully: $sort_name"
}
