#!/bin/bash
# Installed as /usr/local/sbin/wishmastercave-publish (root-owned).
# Builds a git-archive tarball as an unprivileged, sandboxed user, then swaps
# the result into place atomically. Usage: wishmastercave-publish <tarball>
set -euo pipefail
umask 022

SITE=/srv/wishmastercave
WORK=/var/lib/wmc-build
KEEP=5
tarball=${1:?usage: wishmastercave-publish <tarball>}

exec 9>/run/wishmastercave-publish.lock
flock -n 9 || { echo "another publish is running" >&2; exit 1; }

sandbox=(
  --quiet --wait --collect --pipe --service-type=exec
  -p User=wmc-build -p Group=wmc-build
  -p WorkingDirectory="$WORK/src"
  -p Environment=HOME="$WORK"
  -p Environment=npm_config_ignore_scripts=true
  -p NoNewPrivileges=yes -p CapabilityBoundingSet=
  -p ProtectSystem=strict -p ReadWritePaths="$WORK"
  -p ProtectHome=yes -p PrivateTmp=yes -p PrivateDevices=yes
  -p "InaccessiblePaths=-/run/media -/media -/mnt -/run/user -/run/tailscale"
  -p ProtectKernelTunables=yes -p ProtectKernelModules=yes
  -p ProtectKernelLogs=yes -p ProtectControlGroups=yes
  -p ProtectProc=invisible -p RestrictNamespaces=yes
  -p LockPersonality=yes -p SystemCallArchitectures=native
  -p MemoryMax=2G -p TasksMax=256 -p RuntimeMaxSec=300
)
# Not in the base set: it blocks openat2, which GNU tar needs for extraction.
no_suid=(-p RestrictSUIDSGID=yes)
# Install may reach the npm registry but not the LAN, tailnet or local services.
fetch_net=(
  -p "IPAddressDeny=127.0.0.0/8 ::1/128 10.0.0.0/8 172.16.0.0/12 192.168.0.0/16 100.64.0.0/10 169.254.0.0/16 fc00::/7 fe80::/10"
  -p "IPAddressAllow=127.0.0.53/32"
)
# Dependency code only ever runs here, with no network at all.
no_net=(-p PrivateNetwork=yes)

rm -rf "$WORK/src"
install -d -o wmc-build -g wmc-build -m 700 "$WORK/src"

echo "==> Extracting"
systemd-run "${sandbox[@]}" "${no_net[@]}" /usr/bin/tar -x --no-same-owner -f - < "$tarball"

echo "==> Installing dependencies (lockfile only, no install scripts)"
systemd-run "${sandbox[@]}" "${no_suid[@]}" "${fetch_net[@]}" /usr/bin/npm ci --omit=dev --ignore-scripts --no-audit --no-fund

echo "==> Generating"
systemd-run "${sandbox[@]}" "${no_suid[@]}" "${no_net[@]}" "$WORK/src/node_modules/.bin/hexo" generate --silent

out=$WORK/src/public
echo "==> Checking output"
[[ -f $out/index.html ]] || { echo "no index.html in build" >&2; exit 1; }
files=$(find "$out" -type f | wc -l)
(( files >= 50 )) || { echo "only $files files, refusing to publish" >&2; exit 1; }
if [[ -n $(find "$out" ! -type f ! -type d -print -quit) ]]; then
  echo "build contains symlinks or special files, refusing to publish" >&2
  exit 1
fi

release=$SITE/releases/$(date +%Y%m%d-%H%M%S)
cp -R --no-preserve=all "$out" "$release"
chown -R root:root "$release"
find "$release" -type d -exec chmod 755 {} +
find "$release" -type f -exec chmod 644 {} +

ln -sfn "releases/$(basename "$release")" "$SITE/.current.new"
mv -T "$SITE/.current.new" "$SITE/current"
echo "==> Live: $release ($files files)"

ls -1dt "$SITE"/releases/* | tail -n +$((KEEP + 1)) | xargs -r rm -rf --
