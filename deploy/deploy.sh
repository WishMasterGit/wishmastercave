#!/bin/bash
# Publish a commit to the live site. Usage: deploy/deploy.sh [git-ref]
set -euo pipefail
cd "$(git -C "$(dirname "$(readlink -f "$0")")" rev-parse --show-toplevel)"

ref=${1:-HEAD}
tarball=$(mktemp --suffix=.tar)
trap 'rm -f "$tarball"' EXIT
git archive --format=tar -o "$tarball" "$ref"
echo "Publishing $(git rev-parse --short "$ref")"
sudo -A /usr/local/sbin/wishmastercave-publish "$tarball"
