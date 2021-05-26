let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let diskfree =
              ( if    _params.permitLowerClassCPU
                then  [ InstanceType.m4-xlarge ]
                else  [] : List InstanceType
              )
            # [ InstanceType.m5a-xlarge, InstanceType.m5n-xlarge ]

      let withdisk = [ InstanceType.m5ad-xlarge, InstanceType.m5dn-xlarge ]

      in    withdisk
          # ( if    _params.permitLosingLocalDisk
              then  diskfree
              else  [] : List InstanceType
            )
