let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then  [ InstanceType.c5-2xlarge
            , InstanceType.c5d-2xlarge
            , InstanceType.m5-xlarge
            , InstanceType.m5d-xlarge
            , InstanceType.m5n-xlarge
            , InstanceType.m5dn-xlarge
            , InstanceType.r5-xlarge
            , InstanceType.r5n-xlarge
            ]
      else  [] : List InstanceType
