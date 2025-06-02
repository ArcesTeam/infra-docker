#!/bin/bash

#
# Copyright (c) 2025 ArcesTeam. All rights reserved.
# This project is licensed under the MIT License. See the LICENSE file for details.
# This software is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the MIT License for more details.
#
#

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/common.sh"

TARGET_DIR="${1:-.}"

log_info "Scanning $TARGET_DIR for build.sh scripts..."

has_error=0

find "$TARGET_DIR" -type f -name "build.sh" | while read -r build_script; do
    script_dir="$(dirname "$build_script")"

    echo "::group::Executing build script: $script_dir/build.sh"

    if ! (cd "$script_dir" && bash build.sh); then
        log_warn "Failed to execute build script in $script_dir/build.sh"
        has_error=1
    fi

    echo "::endgroup::"
done

if [[ "$has_error" -eq 1 ]]; then
    log_error "One or more build scripts failed."
    exit 1
else
    log_info "All build scripts executed successfully."
fi
