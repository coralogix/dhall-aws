let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5-xlarge
      , InstanceType.r5d-xlarge
      , InstanceType.r5n-xlarge
      , InstanceType.r5dn-xlarge
      ]
