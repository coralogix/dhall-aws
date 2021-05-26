let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.m5-xlarge
            , InstanceType.m5d-xlarge
            , InstanceType.m5a-xlarge
            , InstanceType.m5ad-xlarge
            , InstanceType.m5n-xlarge
            , InstanceType.m5dn-xlarge
            ]

      let cross-instances = [ InstanceType.r5-xlarge ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
