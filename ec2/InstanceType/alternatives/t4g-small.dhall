let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then  [ InstanceType.c6g-large
            , InstanceType.c6gd-large
            , InstanceType.c6gn-large
            , InstanceType.m6g-large
            , InstanceType.m6gd-large
            , InstanceType.r6g-large
            , InstanceType.r6gd-large
            ]
      else  [] : List InstanceType
