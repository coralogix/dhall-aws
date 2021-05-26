let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let worsenetwork =
            let diskfree =
                    ( if    _params.permitLowerClassCPU
                      then  [ InstanceType.m4-xlarge ]
                      else  [] : List InstanceType
                    )
                  # [ InstanceType.m4-xlarge
                    , InstanceType.m5-xlarge
                    , InstanceType.m5a-xlarge
                    ]

            let withdisk = [ InstanceType.m5d-xlarge, InstanceType.m5ad-xlarge ]

            in  { diskfree, withdisk }

      let samenetwork = { diskfree = [ InstanceType.m5n-xlarge ] }

      in  if    _params.permitWorseNetwork
          then    worsenetwork.withdisk
                # ( if    _params.permitLosingLocalDisk
                    then  worsenetwork.diskfree # samenetwork.diskfree
                    else  [] : List InstanceType
                  )
          else  if _params.permitLosingLocalDisk
          then  samenetwork.diskfree
          else  [] : List InstanceType
