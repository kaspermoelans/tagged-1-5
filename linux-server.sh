#!/bin/sh
base_path="$(dirname "$(realpath "$0")")"
"$base_path/linux-server.x86_64" "$@"
