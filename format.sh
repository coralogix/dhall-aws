#!/usr/bin/env bash

set -euo pipefail

echo '[INFO][dhall-aws][format.sh] Formatting...'
deepest_level=$(find . -name '*.dhall' | sed 's/[^\/]//g' | awk '{ print length }' | sort | tail -n 1)
while IFS= read -r -d '' dhall_file ; do
  echo "[INFO][dhall-aws][format.sh] Formatting: ${dhall_file} ..."
  dhall format --inplace "${dhall_file}"
done < <(find . -name '*.dhall' -print0)
echo '[INFO][dhall-aws][format.sh] Finished formatting successfully!'
