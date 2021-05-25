let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitted =
            if    _params.permitLowerEBSBandwidth && _params.permitWorseNetwork
            then    [ InstanceType.c6g-medium ]
                  # ( if    _params.permitCrossInstanceFamily
                      then  [ InstanceType.m6g-medium
                            , InstanceType.m6gd-medium
                            , InstanceType.r6g-medium
                            , InstanceType.r6gd-medium
                            ]
                      else  [] : List InstanceType
                    )
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitLosingLocalDisk
          # permitted
