#!/bin/bash
# One-time root setup. Safe to re-run after changing files in this directory.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")"

# The stock service would listen on all interfaces, so it never gets to start.
systemctl mask nginx.service
apt-get install -y --no-install-recommends nginx

id wmc-build >/dev/null 2>&1 || useradd --system --no-create-home \
  --home-dir /var/lib/wmc-build --shell /usr/sbin/nologin wmc-build
install -d -o wmc-build -g wmc-build -m 700 /var/lib/wmc-build
install -d -m 755 /srv/wishmastercave /srv/wishmastercave/releases /etc/wishmastercave

install -m 644 nginx.conf /etc/wishmastercave/nginx.conf
install -m 644 wishmastercave-web.service /etc/systemd/system/wishmastercave-web.service
install -m 755 publish.sh /usr/local/sbin/wishmastercave-publish

# Security updates replace the binary, and the masked stock unit will not restart ours.
cat > /etc/apt/apt.conf.d/90wishmastercave-web <<'CONF'
DPkg::Post-Invoke { "systemctl try-restart wishmastercave-web.service || true"; };
CONF

systemctl daemon-reload
systemctl enable wishmastercave-web.service
systemctl restart wishmastercave-web.service
