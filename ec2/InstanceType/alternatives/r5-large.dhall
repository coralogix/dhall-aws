let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.r5d-large
            , InstanceType.r5n-large
            , InstanceType.r5dn-large
            ]

      let permitLowerClassCPU =
            if    _params.permitLowerClassCPU
            then  [ InstanceType.r5a-large, InstanceType.r5ad-large ]
            else  [] : List InstanceType

      in  instancefamily # permitLowerClassCPU
