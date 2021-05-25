let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let cross-instances = [ InstanceType.m5d-4xlarge ]

      let instancefamily =
            let diskfree =
                {- diskfree - an instance type with no local disk -}
                  let lowDiskBandwidth =
                      {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}
                        [ InstanceType.c5a-4xlarge ]

                  in    ( if    _params.permitLowerEBSBandwidth
                          then  lowDiskBandwidth
                          else  [] : List InstanceType
                        )
                      # [ InstanceType.c5-4xlarge, InstanceType.c5n-4xlarge ]

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
