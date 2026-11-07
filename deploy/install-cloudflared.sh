#!/bin/bash
# Installs cloudflared from Cloudflare's signed apt repository and keeps it patched.
# Pinned key fingerprint: CC94 B39C 77AE 7342 A68B 8962 8A68 2D30 8D4E 5E73
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

install -d -m 755 /usr/share/keyrings
install -m 644 cloudflare-main.gpg /usr/share/keyrings/cloudflare-main.gpg
echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared any main' \
  > /etc/apt/sources.list.d/cloudflared.list

apt-get update -qq -o Dir::Etc::sourcelist=/etc/apt/sources.list.d/cloudflared.list \
  -o Dir::Etc::sourceparts=- -o APT::Get::List-Cleanup=0
apt-get install -y --no-install-recommends cloudflared

cat > /etc/apt/apt.conf.d/51wishmastercave-cloudflared <<'CONF'
Unattended-Upgrade::Origins-Pattern { "origin=cloudflared"; };
CONF
