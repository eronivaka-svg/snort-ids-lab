#!/usr/bin/env bash
# New portfolio helper, not the original classroom script.
set -euo pipefail
if [[ "${RUN_ONLY_INSIDE_LABTAINERS:-}" != 'YES' ]]; then
  echo 'Review before use. Only run inside your authorized isolated lab.' >&2
  exit 2
fi
RULE_PATH=${1:-/etc/snort/rules/experimental.rules}
IFACE=${2:-enp0s3}
command -v snort >/dev/null || { echo 'Snort not installed'; exit 2; }
sudo snort -T -i "$IFACE" -c "$RULE_PATH"
printf '\nValidation does not prove that alerts are generated.\n'
