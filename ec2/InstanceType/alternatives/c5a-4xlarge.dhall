let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances =
            [ InstanceType.m5a-4xlarge, InstanceType.r5a-4xlarge ]

      let instancefamily =
            [ InstanceType.c5-4xlarge
            , InstanceType.c5d-4xlarge
            , InstanceType.c5n-4xlarge
            ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
