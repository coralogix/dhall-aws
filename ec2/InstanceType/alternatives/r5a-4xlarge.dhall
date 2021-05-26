let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5-4xlarge, InstanceType.r5n-4xlarge ]
