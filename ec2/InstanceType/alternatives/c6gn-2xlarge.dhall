let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitted =
            if    _params.permitLowerEBSBandwidth && _params.permitWorseNetwork
            then    [ InstanceType.c6g-2xlarge ]
                  # ( if    _params.permitCrossInstanceFamily
                      then  [ InstanceType.m6g-2xlarge
                            , InstanceType.m6gd-2xlarge
                            , InstanceType.r6g-2xlarge
                            , InstanceType.r6gd-2xlarge
                            ]
                      else  [] : List InstanceType
                    )
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitLosingLocalDisk
          # permitted
