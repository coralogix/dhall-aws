let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let instancefamily = [] : List InstanceType

      let permitLowerClassCPU = [] : List InstanceType

      let permitLosingLocalDisk = [] : List InstanceType

      let permitted =
            if    _params.permitLowerEBSBandwidth && _params.permitWorseNetwork
            then    [ InstanceType.c6g-large ]
                  # ( if    _params.permitCrossInstanceFamily
                      then  [ InstanceType.m6g-large
                            , InstanceType.m6gd-large
                            , InstanceType.r6g-large
                            , InstanceType.r6gd-large
                            ]
                      else  [] : List InstanceType
                    )
            else  [] : List InstanceType

      in    instancefamily
          # permitLowerClassCPU
          # permitLosingLocalDisk
          # permitted
