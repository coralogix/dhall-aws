let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitWorseNetwork
      then  [ InstanceType.r5-2xlarge, InstanceType.r5a-2xlarge ]
      else  [] : List InstanceType
