let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      [ InstanceType.r5-large, InstanceType.r5n-large ]
