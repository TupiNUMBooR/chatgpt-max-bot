#!/usr/bin/env bash
# set-repo-env.sh
set -euo pipefail

source ./.env

gh variable set DOCKERHUB_USERNAME --body "${DOCKERHUB_USERNAME:?}"
gh secret set DOCKERHUB_TOKEN --body "${DOCKERHUB_TOKEN:?}"
