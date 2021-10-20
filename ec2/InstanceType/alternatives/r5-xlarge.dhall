let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.r5d-xlarge
            , InstanceType.r5n-xlarge
            , InstanceType.r5dn-xlarge
            ]

      let permitLowerClassCPU =
            if    _params.permitLowerClassCPU
            then  [ InstanceType.r5a-xlarge, InstanceType.r5ad-xlarge ]
            else  [] : List InstanceType

      in  instancefamily # permitLowerClassCPU
