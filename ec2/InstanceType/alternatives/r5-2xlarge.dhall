let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5a-2xlarge, InstanceType.r5n-2xlarge ]
