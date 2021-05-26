let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let diskfree =
              ( if    _params.permitLowerClassCPU
                then  [ InstanceType.m4-large ]
                else  [] : List InstanceType
              )
            # [ InstanceType.m5a-large, InstanceType.m5n-large ]

      let withdisk = [ InstanceType.m5ad-large, InstanceType.m5dn-large ]

      in    withdisk
          # ( if    _params.permitLosingLocalDisk
              then  diskfree
              else  [] : List InstanceType
            )
