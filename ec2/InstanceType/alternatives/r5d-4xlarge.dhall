let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.r5dn-4xlarge ]

      let permitLowerClassCPU =
            if    _params.permitLowerClassCPU
            then  [ InstanceType.r5ad-4xlarge ]
            else  [] : List InstanceType

      in  instancefamily # permitLowerClassCPU
