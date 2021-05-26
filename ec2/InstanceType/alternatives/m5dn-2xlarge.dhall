let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      let worsenetwork =
            let diskfree =
                    ( if    _params.permitLowerClassCPU
                      then  [ InstanceType.m4-2xlarge ]
                      else  [] : List InstanceType
                    )
                  # [ InstanceType.m4-2xlarge
                    , InstanceType.m5-2xlarge
                    , InstanceType.m5a-2xlarge
                    ]

            let withdisk =
                  [ InstanceType.m5d-2xlarge, InstanceType.m5ad-2xlarge ]

            in  { diskfree, withdisk }

      let samenetwork = { diskfree = [ InstanceType.m5n-2xlarge ] }

      in  if    _params.permitWorseNetwork
          then    worsenetwork.withdisk
                # ( if    _params.permitLosingLocalDisk
                    then  worsenetwork.diskfree # samenetwork.diskfree
                    else  [] : List InstanceType
                  )
          else  if _params.permitLosingLocalDisk
          then  samenetwork.diskfree
          else  [] : List InstanceType
