let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
        ( if    _params.permitCrossInstanceFamily
          then  [ InstanceType.c5-xlarge
                , InstanceType.c5d-xlarge
                , InstanceType.m5-large
                , InstanceType.m5d-large
                , InstanceType.m5n-large
                , InstanceType.m5dn-large
                , InstanceType.r5-large
                , InstanceType.r5n-large
                ]
          else  [] : List InstanceType
        )
      # ( if    _params.permitLowerClassCPU
          then  [ InstanceType.t3a-large ]
          else  [] : List InstanceType
        )
