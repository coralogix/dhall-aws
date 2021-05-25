let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let worsenetwork =
            let diskfree =
                    ( if    _params.permitLowerClassCPU
                      then  [ InstanceType.m4-large ]
                      else  [] : List InstanceType
                    )
                  # [ InstanceType.m4-large
                    , InstanceType.m5-large
                    , InstanceType.m5a-large
                    ]

            let withdisk = [ InstanceType.m5d-large, InstanceType.m5ad-large ]

            in  { diskfree, withdisk }

      let samenetwork = { diskfree = [ InstanceType.m5n-large ] }

      in  if    _params.permitWorseNetwork
          then    worsenetwork.withdisk
                # ( if    _params.permitLosingLocalDisk
                    then  worsenetwork.diskfree # samenetwork.diskfree
                    else  [] : List InstanceType
                  )
          else  if _params.permitLosingLocalDisk
          then  samenetwork.diskfree
          else  [] : List InstanceType
