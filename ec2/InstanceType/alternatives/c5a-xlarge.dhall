let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances = [ InstanceType.m5a-xlarge, InstanceType.r5a-xlarge ]

      let instancefamily =
            [ InstanceType.c5-xlarge
            , InstanceType.c5d-xlarge
            , InstanceType.c5n-xlarge
            ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
