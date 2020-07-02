#!/usr/bin/env bash

set -euo pipefail

echo 'Formatting...'
deepest_level=$(find . -name '*.dhall' | sed 's/[^\/]//g' | awk '{ print length }' | sort | tail -n 1)
for depth in $(seq "${deepest_level}" -1 1) ; do
  while IFS= read -r -d '' dhall_file ; do
    echo "Formatting: ${dhall_file} ..."
    dhall format --inplace "${dhall_file}"
  done < <(find . -mindepth "${depth}" -maxdepth "${depth}" -name '*.dhall' -print0)
done
echo 'Finished formatting successfully!'
