#!/usr/bin/env bash

function main {
  set -euo pipefail

  # pricing API only available in us-east-1 and ap-south-1
  export AWS_DEFAULT_REGION='us-east-1'

  # local service_code='AmazonEC2'
  # aws pricing describe-services --service-code "${service_code}"

  # aws pricing get-attribute-values --service-code "${service_code}" --attribute-name 'instance'
# { "Type": "TERM_MATCH"
  # , "Field": "location"
  # , "Value": "${location}"
  # }
# ,
  #for location in $(aws pricing get-attribute-values --service-code AmazonEC2 --attribute-name location --output json | jq -r '.AttributeValues[].Value') ; do

  set -x
  aws pricing get-products --output json --service-code AmazonEC2 --filters file://filters.json | jq
  # done

  # interesting attribtes:
  # instance
  #  T2
  #  T3A
  #  T3
  # instanceType
  #  t3.large , t3.xlarge , r5d.xlarge, etc. but also c3
  # location (english 'EU (Frankfurt)')
  # toLocationType and fromLocationType
  #  AWS Region
  #  Other (for migrations, i.e. from on-prem datacenters)
  # fromLocation
  # toLocation
  # productFamily
  #  Compute Instance
  #  Compute Instance (bare metal)
  #  Dedicated Host
  #  (others: NAT Gateway, CPU Credits, Load Balancer, Storage, etc.)
  # operation

}

main "$@"
