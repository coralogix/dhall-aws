let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances = [ InstanceType.m5d-large ]

      let instancefamily =
            let diskfree =
                {- diskfree - an instance type with no local disk -}
                  let lowDiskBandwidth =
                      {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}
                        [ InstanceType.c5a-large ]

                  in    ( if    _params.permitLowerEBSBandwidth
                          then  lowDiskBandwidth
                          else  [] : List InstanceType
                        )
                      # [ InstanceType.c5-large, InstanceType.c5n-large ]

            in    ([] : List InstanceType)
                # ( if    _params.permitLosingLocalDisk
                    then  diskfree
                    else  [] : List InstanceType
                  )

      in    instancefamily
          # ( if    _params.permitCrossInstanceFamily
              then  cross-instances
              else  [] : List InstanceType
            )
