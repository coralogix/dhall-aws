let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances =
            [ InstanceType.m5a-2xlarge, InstanceType.r5a-2xlarge ]

      let instancefamily =
            [ InstanceType.c5-2xlarge
            , InstanceType.c5d-2xlarge
            , InstanceType.c5n-2xlarge
            ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
