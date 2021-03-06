let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.m5dn-4xlarge ]

      let cross-instances = [ InstanceType.r5n-4xlarge ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
          # ( if    _params.permitLowerClassCPU
              then  [ InstanceType.m4-4xlarge ]
              else  [] : List InstanceType
            )
          # ( if    _params.permitWorseNetwork
              then  [ InstanceType.m5-4xlarge
                    , InstanceType.m5d-4xlarge
                    , InstanceType.m5a-4xlarge
                    , InstanceType.m5ad-4xlarge
                    ]
              else  [] : List InstanceType
            )
