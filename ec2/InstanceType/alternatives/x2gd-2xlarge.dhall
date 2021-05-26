let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitted =
            if    _params.permitCrossInstanceFamily
            then    [ InstanceType.r6gd-4xlarge ]
                  # ( if    _params.permitLosingLocalDisk
                      then  [ InstanceType.r6g-4xlarge ]
                      else  [] : List InstanceType
                    )
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitted
