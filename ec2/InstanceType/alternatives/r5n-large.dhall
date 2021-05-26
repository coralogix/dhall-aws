let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitWorseNetwork
      then  [ InstanceType.r5-large, InstanceType.r5a-large ]
      else  [] : List InstanceType
