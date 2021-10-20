let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5-2xlarge
      , InstanceType.r5d-2xlarge
      , InstanceType.r5n-2xlarge
      , InstanceType.r5dn-2xlarge
      ]
