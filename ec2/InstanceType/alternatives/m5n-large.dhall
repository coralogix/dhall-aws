let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.m5dn-large ]

      let cross-instances = [ InstanceType.r5n-large ]

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
          # ( if    _params.permitLowerClassCPU
              then  [ InstanceType.m4-large ]
              else  [] : List InstanceType
            )
          # ( if    _params.permitWorseNetwork
              then  [ InstanceType.m5-large
                    , InstanceType.m5d-large
                    , InstanceType.m5a-large
                    , InstanceType.m5ad-large
                    ]
              else  [] : List InstanceType
            )
