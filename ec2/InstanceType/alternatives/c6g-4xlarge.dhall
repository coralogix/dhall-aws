let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [ InstanceType.c6gd-4xlarge ]

      let permitLowerClassCPU = [] : List InstanceType

      let permitWorseNetwork = [] : List InstanceType

      let permitLowerEBSBandwidth = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitCrossInstanceFamily =
            if    _params.permitCrossInstanceFamily
            then  [ InstanceType.m6g-4xlarge
                  , InstanceType.m6gd-4xlarge
                  , InstanceType.r6g-4xlarge
                  , InstanceType.r6gd-4xlarge
                  ]
            else  [] : List InstanceType

      let permitUnsupportedByAwsVpcCni =
            if    _params.permitUnsupportedByAwsVpcCni
            then  [ InstanceType.c6gn-4xlarge ]
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitWorseNetwork
          # permitLowerEBSBandwidth
          # permitLosingLocalDisk
          # permitCrossInstanceFamily
          # permitUnsupportedByAwsVpcCni
