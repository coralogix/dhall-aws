let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5d-4xlarge, InstanceType.r5dn-4xlarge ]
