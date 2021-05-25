let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then  [ InstanceType.c5-4xlarge
            , InstanceType.c5d-4xlarge
            , InstanceType.m5-2xlarge
            , InstanceType.m5d-2xlarge
            , InstanceType.m5n-2xlarge
            , InstanceType.m5dn-2xlarge
            , InstanceType.r5-2xlarge
            , InstanceType.r5n-2xlarge
            ]
      else  [] : List InstanceType
