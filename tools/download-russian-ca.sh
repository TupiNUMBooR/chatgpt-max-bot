#!/usr/bin/env bash
# Download Russian CA certificates into the repository.
set -Eeuo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
CERT_DIR="$ROOT_DIR/certs"
BASE_URL='https://gu-st.ru/content/lending'

command -v curl >/dev/null || { echo 'curl is required' >&2; exit 127; }
command -v openssl >/dev/null || { echo 'openssl is required' >&2; exit 127; }
mkdir -p "$CERT_DIR"

for name in russian_trusted_root_ca_pem.crt russian_trusted_sub_ca_pem.crt; do
  target="$CERT_DIR/$name"
  tmp="$(mktemp "$CERT_DIR/.${name}.XXXXXX")"
  trap 'rm -f -- "$tmp"' EXIT
  curl --fail --silent --show-error --location --retry 2 \
    "$BASE_URL/$name" -o "$tmp"
  openssl x509 -in "$tmp" -noout -subject -issuer -dates >&2
  openssl x509 -in "$tmp" -noout -text | grep -q 'CA:TRUE' || {
    echo "Not a CA certificate: $name" >&2; exit 65;
  }
  mv -f -- "$tmp" "$target"
  trap - EXIT
done

openssl verify -CAfile "$CERT_DIR/russian_trusted_root_ca_pem.crt" \
  "$CERT_DIR/russian_trusted_sub_ca_pem.crt" >&2
printf 'Certificates saved to %s\n' "$CERT_DIR" >&2
