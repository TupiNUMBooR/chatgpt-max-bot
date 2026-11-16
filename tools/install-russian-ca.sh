#!/usr/bin/env bash
# Install checked-in Russian CA certificates into Ubuntu/WSL trust store.
set -Eeuo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
CERT_DIR="$ROOT_DIR/certs"
DEST='/usr/local/share/ca-certificates/russian'

for name in russian_trusted_root_ca_pem.crt russian_trusted_sub_ca_pem.crt; do
  [[ -s "$CERT_DIR/$name" ]] || {
    printf 'Missing %s; run tools/download-russian-ca.sh first\n' "$CERT_DIR/$name" >&2
    exit 66
  }
done

sudo install -d -m 0755 "$DEST"
sudo install -m 0644 "$CERT_DIR"/*.crt "$DEST/"
sudo update-ca-certificates
