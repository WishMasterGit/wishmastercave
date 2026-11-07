#!/bin/bash
# Installs the tunnel service. Usage: install-tunnel.sh <credentials.json>
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"
creds=${1:?usage: install-tunnel.sh <credentials.json>}

install -m 600 -o root -g root "$creds" /etc/wishmastercave/tunnel.json
install -m 644 cloudflared.yml /etc/wishmastercave/cloudflared.yml
install -m 644 nginx.conf /etc/wishmastercave/nginx.conf
install -m 644 wishmastercave-tunnel.service /etc/systemd/system/wishmastercave-tunnel.service

cat > /etc/apt/apt.conf.d/90wishmastercave-web <<'CONF'
DPkg::Post-Invoke { "systemctl try-restart wishmastercave-web.service wishmastercave-tunnel.service || true"; };
CONF

systemctl daemon-reload
systemctl reload wishmastercave-web.service
systemctl enable wishmastercave-tunnel.service
systemctl restart wishmastercave-tunnel.service
