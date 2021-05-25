let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances =
            let lowClass =

                {-
                  lowClass - all instance types that have lower ECU and lower network performance
                    -}
                  [ InstanceType.m4-2xlarge ]

            in    [ InstanceType.m5-2xlarge, InstanceType.r5-2xlarge ]
                # ( if        _params.permitLowerClassCPU
                          &&  _params.permitWorseNetwork
                          &&  _params.permitLowerEBSBandwidth
                    then  lowClass
                    else  [] : List InstanceType
                  )

      let instancefamily =
            let lowDiskBandwidth =

                {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                  [ InstanceType.c5a-2xlarge ]

            in    [ InstanceType.c5d-2xlarge, InstanceType.c5n-2xlarge ]
                # ( if    _params.permitLowerEBSBandwidth
                    then  lowDiskBandwidth
                    else  [] : List InstanceType
                  )

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
