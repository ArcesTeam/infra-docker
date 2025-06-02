#!/bin/bash

#
# Copyright (c) 2025 ArcesTeam. All rights reserved.
# This project is licensed under the MIT License. See the LICENSE file for details.
# This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT License for more details.
#
#

set -euo pipefail

cd "$(dirname "$0")"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../../scripts/common.sh"

readonly image_role="base"
readonly image_name="debian"
# shellcheck disable=SC2155
readonly image_version="$(read_version)"
# shellcheck disable=SC2155
readonly image_tag="$(get_tag "$image_role" "$image_name" "$image_version")"

if image_exists_remotely "$image_tag"; then
    exit 0
fi

build_and_push_image "$image_role" "$image_name" "$image_version"
