let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitWorseNetwork
      then  [ InstanceType.r5-4xlarge, InstanceType.r5a-4xlarge ]
      else  [] : List InstanceType
