let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitted =
            if    _params.permitLosingLocalDisk
            then    [ InstanceType.m6g-2xlarge ]
                  # ( if    _params.permitCrossInstanceFamily
                      then  [ InstanceType.r6g-2xlarge ]
                      else  [] : List InstanceType
                    )
            else  if _params.permitCrossInstanceFamily
            then  [ InstanceType.r6gd-2xlarge ]
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitted
