let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances =
            [ InstanceType.m5n-4xlarge, InstanceType.r5n-4xlarge ]

      let instancefamily = [] : List InstanceType

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
