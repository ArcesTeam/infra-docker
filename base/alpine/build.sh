#!/bin/bash

#
# Copyright (c) 2025 ArcesTeam. All rights reserved.
# This project is licensed under the MIT License. See the LICENSE file for details.
# This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT License for more details.
#
#

set -euo pipefail

cd "$(dirname "$0")"

build() {
    local image_name="alpine"
    local version
    local tag

    if [[ ! -f "VERSION" ]]; then
        echo "VERSION file not found. Please create a VERSION file with the image version."
        exit 1
    fi

    version=$(cat "VERSION")
    tag="ghcr.io/arcesteam/infra/base/$image_name:$version"

    echo "Building Docker image: $image_name:$version"
    docker build -t "$tag" \
        --build-arg "IMAGE_NAME=$image_name" \
        --build-arg "VERSION=$version" \
        --file "Dockerfile" \
        --progress=plain \
        .
    echo "Docker image built successfully: $image_name:$version"

    echo "Pushing Docker image: $image_name:$version"
    docker push "$tag"
    echo "Docker image pushed successfully: $image_name:$version"
}

build
