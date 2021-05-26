let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let diskfree =
              ( if    _params.permitLowerClassCPU
                then  [ InstanceType.m4-4xlarge ]
                else  [] : List InstanceType
              )
            # [ InstanceType.m5a-4xlarge, InstanceType.m5n-4xlarge ]

      let withdisk = [ InstanceType.m5ad-4xlarge, InstanceType.m5dn-4xlarge ]

      in    withdisk
          # ( if    _params.permitLosingLocalDisk
              then  diskfree
              else  [] : List InstanceType
            )
