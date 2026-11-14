#!/usr/bin/env bash
# entrypoint.sh
set -Eeuo pipefail

main() {
  printf '%s\n' 'chatgpt-max-bot: entrypoint stub'

  trap 'exit 0' INT TERM
  while :; do
    sleep 1
  done
}

main "$@"
