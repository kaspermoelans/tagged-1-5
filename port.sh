#!/bin/sh
echo -ne '\033c\033]0;First Game\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/linux-server.x86_64" "$@"
