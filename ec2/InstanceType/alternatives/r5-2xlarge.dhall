let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily =
            [ InstanceType.r5d-2xlarge
            , InstanceType.r5n-2xlarge
            , InstanceType.r5dn-2xlarge
            ]

      let permitLowerClassCPU =
            if    _params.permitLowerClassCPU
            then  [ InstanceType.r5a-2xlarge, InstanceType.r5ad-2xlarge ]
            else  [] : List InstanceType

      in  instancefamily # permitLowerClassCPU
