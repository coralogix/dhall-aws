let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances = [ InstanceType.m5a-large, InstanceType.r5a-large ]

      let instancefamily =
            [ InstanceType.c5-large
            , InstanceType.c5d-large
            , InstanceType.c5n-large
            ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
