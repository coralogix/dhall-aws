let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let diskfree =
              ( if    _params.permitLowerClassCPU
                then  [ InstanceType.m4-2xlarge ]
                else  [] : List InstanceType
              )
            # [ InstanceType.m5-2xlarge
              , InstanceType.m5a-2xlarge
              , InstanceType.m5n-2xlarge
              ]

      let withdisk = [ InstanceType.m5d-2xlarge, InstanceType.m5dn-2xlarge ]

      in    withdisk
          # ( if    _params.permitLosingLocalDisk
              then  diskfree
              else  [] : List InstanceType
            )
