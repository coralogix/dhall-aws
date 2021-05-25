let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then  [ InstanceType.c6g-2xlarge
            , InstanceType.c6gd-2xlarge
            , InstanceType.c6gn-2xlarge
            , InstanceType.m6g-xlarge
            , InstanceType.m6gd-xlarge
            , InstanceType.r6g-xlarge
            , InstanceType.r6gd-xlarge
            ]
      else  [] : List InstanceType
