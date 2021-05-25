let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.m5-4xlarge
            , InstanceType.m5d-4xlarge
            , InstanceType.m5a-4xlarge
            , InstanceType.m5ad-4xlarge
            , InstanceType.m5n-4xlarge
            , InstanceType.m5dn-4xlarge
            ]

      let cross-instances = [ InstanceType.r5-4xlarge ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
