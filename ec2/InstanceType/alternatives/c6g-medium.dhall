let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.c6gd-medium ]

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitCrossInstanceFamily =
            if    _params.permitCrossInstanceFamily
            then  [ InstanceType.m6g-medium
                  , InstanceType.m6gd-medium
                  , InstanceType.r6g-medium
                  , InstanceType.r6gd-medium
                  ]
            else  [] : List InstanceType

      let permitUnsupportedByAwsVpcCni =
            if    _params.permitUnsupportedByAwsVpcCni
            then  [ InstanceType.c6gn-medium ]
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitLosingLocalDisk
          # permitCrossInstanceFamily
          # permitUnsupportedByAwsVpcCni
