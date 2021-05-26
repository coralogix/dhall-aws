let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances =
            let lowClass =

                {-
                  lowClass - all instance types that have lower ECU and lower network performance
                    -}
                  [ InstanceType.m4-large ]

            in    [ InstanceType.m5-large, InstanceType.r5-large ]
                # ( if        _params.permitLowerClassCPU
                          &&  _params.permitWorseNetwork
                          &&  _params.permitLowerEBSBandwidth
                    then  lowClass
                    else  [] : List InstanceType
                  )

      let instancefamily =
            let lowDiskBandwidth =

                {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                  [ InstanceType.c5a-large ]

            in    [ InstanceType.c5d-large, InstanceType.c5n-large ]
                # ( if    _params.permitLowerEBSBandwidth
                    then  lowDiskBandwidth
                    else  [] : List InstanceType
                  )

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
