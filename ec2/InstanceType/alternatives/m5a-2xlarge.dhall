let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.m5-2xlarge
            , InstanceType.m5d-2xlarge
            , InstanceType.m5ad-2xlarge
            , InstanceType.m5n-2xlarge
            , InstanceType.m5dn-2xlarge
            ]

      let cross-instances = [ InstanceType.r5a-2xlarge ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
          # ( if    _params.permitLowerClassCPU
              then  [ InstanceType.m4-2xlarge ]
              else  [] : List InstanceType
            )
