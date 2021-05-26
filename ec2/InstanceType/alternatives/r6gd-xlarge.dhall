let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitLosingLocalDisk =
            if    _params.permitLosingLocalDisk
            then  [ InstanceType.r6g-xlarge ]
            else  [] : List InstanceType

      let permitCrossInstanceFamily =
            if        _params.permitCrossInstanceFamily
                  &&  _params.permitUnsupportedByAwsVpcCni
            then  [ InstanceType.x2gd-xlarge ]
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitLosingLocalDisk
          # permitCrossInstanceFamily
