let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.r6gd-2xlarge ]

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitCrossInstanceFamily =
            if        _params.permitCrossInstanceFamily
                  &&  _params.permitUnsupportedByAwsVpcCni
            then  [ InstanceType.x2gd-2xlarge ]
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitLosingLocalDisk
          # permitCrossInstanceFamily
