#!/usr/bin/env bash

set -euo pipefail

echo '[INFO][dhall-aws][.githooks/check-format.sh] Checking formatting...'
for depth in $(seq "${deepest_level}" -1 1) ; do
  while IFS= read -r -d '' dhall_file ; do
    echo "[INFO][dhall-aws][check-format.sh] Checking: ${dhall_file} ..."
    dhall format --check --inplace "${dhall_file}"
  done < <(find . -mindepth "${depth}" -maxdepth "${depth}" -name '*.dhall' -print0)
done
echo '[INFO][dhall-aws][.githooks/check-format.sh] Finished checking formatting successfully!'
