#! /usr/bin/env bash

set -e

for ec2inst in $(find ./alternatives -type f -not -name 'Parameters.dhall' | xargs basename -s '.dhall'); do
  echo "--------- $ec2inst ---------------"
  dhall <<EOF
let Prelude = https://raw.githubusercontent.com/dhall-lang/dhall-lang/v17.0.0/Prelude/package.dhall
let Parameters = ./alternatives/Parameters.dhall
let p = Parameters.permitAll
let specs = ./specs.dhall
let I = ./Type.dhall
in Prelude.List.all I (\\(alt: I) -> let i = I.$ec2inst in Prelude.Natural.lessThanEqual (specs.vCPU i) (specs.vCPU alt) && Prelude.Natural.lessThanEqual (specs.memory i) (specs.memory alt)) (./alternatives/$ec2inst.dhall p)
EOF
done
