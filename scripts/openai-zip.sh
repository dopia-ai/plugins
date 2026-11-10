#!/bin/sh
# Builds the ZIP uploaded to OpenAI's plugin portal (platform.openai.com/plugins).
#
# The package is the portable Agent Plugins layout in plugins/dopia:
# plugin.json, mcp.json, skills/, the icon and the README. The Claude-only
# files (.claude-plugin/, .mcp.json) are left out so the portal sees exactly
# one manifest and one MCP server; review test cases require exactly one.
#
# Usage: scripts/openai-zip.sh   ->  dist/dopia-openai-<version>.zip
set -eu

root=$(cd "$(dirname "$0")/.." && pwd)
src="$root/plugins/dopia"
version=$(sed -n 's/^  "version": "\(.*\)",$/\1/p' "$src/plugin.json")
[ -n "$version" ] || { echo "no version in plugin.json" >&2; exit 1; }

mkdir -p "$root/dist"
out="$root/dist/dopia-openai-$version.zip"
rm -f "$out"

cd "$src"
zip -q -r -X "$out" plugin.json mcp.json icon.png README.md skills -x '*.DS_Store'
unzip -l "$out"
echo "$out"
