#!/usr/bin/env bash

set -euo pipefail

echo '[INFO][dhall-aws][.githooks/format.sh] Formatting...'
while IFS= read -r -d '' dhall_file ; do
  echo "[INFO][dhall-aws][.githooks/format.sh] Formatting: ${dhall_file} ..."
  dhall format --inplace "${dhall_file}"
done < <(find . -name '*.dhall' -print0)
echo '[INFO][dhall-aws][.githooks/format.sh] Finished formatting successfully!'
