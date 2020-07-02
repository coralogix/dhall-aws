#!/usr/bin/env bash

set -euo pipefail

echo '[TEST][#1] Check that package hashes are up-to-date...'
deepest_level=$(find . -name 'package.dhall' | sed 's/[^\/]//g' | awk '{ print length }' | sort | tail -n 1)
for depth in $(seq "${deepest_level}" -1 1) ; do
  while IFS= read -r -d '' package_dhall ; do
    echo "[TEST][#1][package: ${package_dhall}] Checking..."
    set +e
    dhall freeze --cache --all --check --inplace "${package_dhall}"
    if [[ $? -ne 0 ]]; then
      set -e
      echo "::error file=${package_dhall}::Test #1 failed, the hashes in package.dhall are not up-to-date."
      exit 1
    fi
    set -e
  done < <(find . -mindepth "${depth}" -maxdepth "${depth}" -name 'package.dhall' -print0)
done
echo '[TEST][#1] Passed.'

echo '[TEST][#2] Check that package.dhall parses... '
set +e
dhall --file package.dhall >/dev/null
if [[ $? -ne 0 ]]; then
  set -e
  echo "::error file=package.dhall::Test #2 failed, package.dhall failed to parse."
  exit 1
fi
set -e
echo '[TEST][#2] Passed.'

echo 'Passed all tests successfully!'
