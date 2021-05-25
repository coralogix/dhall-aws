let imports = ../../imports.dhall

let Prelude = imports.Prelude

let InstanceType = ./Type.dhall

let Parameters = ./alternatives/Parameters.dhall

let alternatives =
      let alternatives
          : Parameters.Type → InstanceType → List InstanceType
          = λ(_params : Parameters.Type) →
            λ(instanceType : InstanceType) →
              merge
                { c5-large = ./alternatives/c5-large.dhall _params
                , c5-xlarge = ./alternatives/c5-xlarge.dhall _params
                , c5-2xlarge = ./alternatives/c5-2xlarge.dhall _params
                , c5-4xlarge = ./alternatives/c5-4xlarge.dhall _params
                , c5a-large = ./alternatives/c5a-large.dhall _params
                , c5a-xlarge = ./alternatives/c5a-xlarge.dhall _params
                , c5a-2xlarge = ./alternatives/c5a-2xlarge.dhall _params
                , c5a-4xlarge = ./alternatives/c5a-4xlarge.dhall _params
                , c5d-large = ./alternatives/c5d-large.dhall _params
                , c5d-xlarge = ./alternatives/c5d-xlarge.dhall _params
                , c5d-2xlarge = ./alternatives/c5d-2xlarge.dhall _params
                , c5d-4xlarge = ./alternatives/c5d-4xlarge.dhall _params
                , c5n-large = ./alternatives/c5n-large.dhall _params
                , c5n-xlarge = ./alternatives/c5n-xlarge.dhall _params
                , c5n-2xlarge = ./alternatives/c5n-2xlarge.dhall _params
                , c5n-4xlarge = ./alternatives/c5n-4xlarge.dhall _params
                , m4-large = ./alternatives/m4-large.dhall _params
                , m4-xlarge = ./alternatives/m4-xlarge.dhall _params
                , m4-2xlarge =
                    let instancefamily =
                          [ InstanceType.m5-2xlarge
                          , InstanceType.m5d-2xlarge
                          , InstanceType.m5a-2xlarge
                          , InstanceType.m5ad-2xlarge
                          , InstanceType.m5n-2xlarge
                          , InstanceType.m5dn-2xlarge
                          ]

                    let cross-instances = [ InstanceType.r5-2xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , m4-4xlarge =
                    let instancefamily =
                          [ InstanceType.m5-4xlarge
                          , InstanceType.m5d-4xlarge
                          , InstanceType.m5a-4xlarge
                          , InstanceType.m5ad-4xlarge
                          , InstanceType.m5n-4xlarge
                          , InstanceType.m5dn-4xlarge
                          ]

                    let cross-instances = [ InstanceType.r5-4xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , m5-large =
                    let instancefamily =
                          [ InstanceType.m5a-large
                          , InstanceType.m5d-large
                          , InstanceType.m5ad-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          ]

                    let cross-instances = [ InstanceType.r5-large ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-large ]
                            else  [] : List InstanceType
                          )
                , m5-xlarge =
                    let instancefamily =
                          [ InstanceType.m5a-xlarge
                          , InstanceType.m5d-xlarge
                          , InstanceType.m5ad-xlarge
                          , InstanceType.m5n-xlarge
                          , InstanceType.m5dn-xlarge
                          ]

                    let cross-instances = [ InstanceType.r5-xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-xlarge ]
                            else  [] : List InstanceType
                          )
                , m5-2xlarge =
                    let instancefamily =
                          [ InstanceType.m5a-2xlarge
                          , InstanceType.m5d-2xlarge
                          , InstanceType.m5ad-2xlarge
                          , InstanceType.m5n-2xlarge
                          , InstanceType.m5dn-2xlarge
                          ]

                    let cross-instances = [ InstanceType.r5-2xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-2xlarge ]
                            else  [] : List InstanceType
                          )
                , m5-4xlarge =
                    let instancefamily =
                          [ InstanceType.m5a-4xlarge
                          , InstanceType.m5d-4xlarge
                          , InstanceType.m5ad-4xlarge
                          , InstanceType.m5n-4xlarge
                          , InstanceType.m5dn-4xlarge
                          ]

                    let cross-instances = [ InstanceType.r5-4xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-4xlarge ]
                            else  [] : List InstanceType
                          )
                , m5d-large =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-large ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5a-large, InstanceType.m5n-large ]

                    let withdisk =
                          [ InstanceType.m5ad-large, InstanceType.m5dn-large ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5d-xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5a-xlarge, InstanceType.m5n-xlarge ]

                    let withdisk =
                          [ InstanceType.m5ad-xlarge, InstanceType.m5dn-xlarge ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5d-2xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-2xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5a-2xlarge
                            , InstanceType.m5n-2xlarge
                            ]

                    let withdisk =
                          [ InstanceType.m5ad-2xlarge
                          , InstanceType.m5dn-2xlarge
                          ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5d-4xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-4xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5a-4xlarge
                            , InstanceType.m5n-4xlarge
                            ]

                    let withdisk =
                          [ InstanceType.m5ad-4xlarge
                          , InstanceType.m5dn-4xlarge
                          ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5a-large =
                    let instancefamily =
                          [ InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5ad-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          ]

                    let cross-instances = [ InstanceType.r5a-large ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-4xlarge ]
                            else  [] : List InstanceType
                          )
                , m5a-xlarge =
                    let instancefamily =
                          [ InstanceType.m5-xlarge
                          , InstanceType.m5d-xlarge
                          , InstanceType.m5ad-xlarge
                          , InstanceType.m5n-xlarge
                          , InstanceType.m5dn-xlarge
                          ]

                    let cross-instances = [ InstanceType.r5a-xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-xlarge ]
                            else  [] : List InstanceType
                          )
                , m5a-2xlarge =
                    let instancefamily =
                          [ InstanceType.m5-2xlarge
                          , InstanceType.m5d-2xlarge
                          , InstanceType.m5ad-2xlarge
                          , InstanceType.m5n-2xlarge
                          , InstanceType.m5dn-2xlarge
                          ]

                    let cross-instances = [ InstanceType.r5a-2xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-2xlarge ]
                            else  [] : List InstanceType
                          )
                , m5a-4xlarge =
                    let instancefamily =
                          [ InstanceType.m5-4xlarge
                          , InstanceType.m5d-4xlarge
                          , InstanceType.m5ad-4xlarge
                          , InstanceType.m5n-4xlarge
                          , InstanceType.m5dn-4xlarge
                          ]

                    let cross-instances = [ InstanceType.r5a-4xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-4xlarge ]
                            else  [] : List InstanceType
                          )
                , m5ad-large =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-large ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-large
                            , InstanceType.m5a-large
                            , InstanceType.m5n-large
                            ]

                    let withdisk =
                          [ InstanceType.m5d-large, InstanceType.m5dn-large ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5ad-xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-xlarge
                            , InstanceType.m5a-xlarge
                            , InstanceType.m5n-xlarge
                            ]

                    let withdisk =
                          [ InstanceType.m5d-xlarge, InstanceType.m5dn-xlarge ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5ad-2xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-2xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-2xlarge
                            , InstanceType.m5a-2xlarge
                            , InstanceType.m5n-2xlarge
                            ]

                    let withdisk =
                          [ InstanceType.m5d-2xlarge
                          , InstanceType.m5dn-2xlarge
                          ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5ad-4xlarge =
                    let diskfree =
                            ( if    _params.permitLowerClassCPU
                              then  [ InstanceType.m4-4xlarge ]
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-4xlarge
                            , InstanceType.m5a-4xlarge
                            , InstanceType.m5n-4xlarge
                            ]

                    let withdisk =
                          [ InstanceType.m5d-4xlarge
                          , InstanceType.m5dn-4xlarge
                          ]

                    in    withdisk
                        # ( if    _params.permitLosingLocalDisk
                            then  diskfree
                            else  [] : List InstanceType
                          )
                , m5n-large =
                    let instancefamily = [ InstanceType.m5dn-large ]

                    let cross-instances = [ InstanceType.r5n-large ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-large ]
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitWorseNetwork
                            then  [ InstanceType.m5-large
                                  , InstanceType.m5d-large
                                  , InstanceType.m5a-large
                                  , InstanceType.m5ad-large
                                  ]
                            else  [] : List InstanceType
                          )
                , m5n-xlarge =
                    let instancefamily = [ InstanceType.m5dn-xlarge ]

                    let cross-instances = [ InstanceType.r5n-xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-xlarge ]
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitWorseNetwork
                            then  [ InstanceType.m5-xlarge
                                  , InstanceType.m5d-xlarge
                                  , InstanceType.m5a-xlarge
                                  , InstanceType.m5ad-xlarge
                                  ]
                            else  [] : List InstanceType
                          )
                , m5n-2xlarge =
                    let instancefamily = [ InstanceType.m5dn-2xlarge ]

                    let cross-instances = [ InstanceType.r5n-2xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-2xlarge ]
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitWorseNetwork
                            then  [ InstanceType.m5-2xlarge
                                  , InstanceType.m5d-2xlarge
                                  , InstanceType.m5a-2xlarge
                                  , InstanceType.m5ad-2xlarge
                                  ]
                            else  [] : List InstanceType
                          )
                , m5n-4xlarge =
                    let instancefamily = [ InstanceType.m5dn-4xlarge ]

                    let cross-instances = [ InstanceType.r5n-4xlarge ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitLowerClassCPU
                            then  [ InstanceType.m4-4xlarge ]
                            else  [] : List InstanceType
                          )
                        # ( if    _params.permitWorseNetwork
                            then  [ InstanceType.m5-4xlarge
                                  , InstanceType.m5d-4xlarge
                                  , InstanceType.m5a-4xlarge
                                  , InstanceType.m5ad-4xlarge
                                  ]
                            else  [] : List InstanceType
                          )
                , m5dn-large =
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

                          let withdisk =
                                [ InstanceType.m5d-large
                                , InstanceType.m5ad-large
                                ]

                          in  { diskfree, withdisk }

                    let samenetwork = { diskfree = [ InstanceType.m5n-large ] }

                    in  if    _params.permitWorseNetwork
                        then    worsenetwork.withdisk
                              # ( if    _params.permitLosingLocalDisk
                                  then    worsenetwork.diskfree
                                        # samenetwork.diskfree
                                  else  [] : List InstanceType
                                )
                        else  if _params.permitLosingLocalDisk
                        then  samenetwork.diskfree
                        else  [] : List InstanceType
                , m5dn-xlarge =
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

                          let withdisk =
                                [ InstanceType.m5d-xlarge
                                , InstanceType.m5ad-xlarge
                                ]

                          in  { diskfree, withdisk }

                    let samenetwork = { diskfree = [ InstanceType.m5n-xlarge ] }

                    in  if    _params.permitWorseNetwork
                        then    worsenetwork.withdisk
                              # ( if    _params.permitLosingLocalDisk
                                  then    worsenetwork.diskfree
                                        # samenetwork.diskfree
                                  else  [] : List InstanceType
                                )
                        else  if _params.permitLosingLocalDisk
                        then  samenetwork.diskfree
                        else  [] : List InstanceType
                , m5dn-2xlarge =
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
                                [ InstanceType.m5d-2xlarge
                                , InstanceType.m5ad-2xlarge
                                ]

                          in  { diskfree, withdisk }

                    let samenetwork =
                          { diskfree = [ InstanceType.m5n-2xlarge ] }

                    in  if    _params.permitWorseNetwork
                        then    worsenetwork.withdisk
                              # ( if    _params.permitLosingLocalDisk
                                  then    worsenetwork.diskfree
                                        # samenetwork.diskfree
                                  else  [] : List InstanceType
                                )
                        else  if _params.permitLosingLocalDisk
                        then  samenetwork.diskfree
                        else  [] : List InstanceType
                , m5dn-4xlarge =
                    let worsenetwork =
                          let diskfree =
                                  ( if    _params.permitLowerClassCPU
                                    then  [ InstanceType.m4-4xlarge ]
                                    else  [] : List InstanceType
                                  )
                                # [ InstanceType.m4-4xlarge
                                  , InstanceType.m5-4xlarge
                                  , InstanceType.m5a-4xlarge
                                  ]

                          let withdisk =
                                [ InstanceType.m5d-4xlarge
                                , InstanceType.m5ad-4xlarge
                                ]

                          in  { diskfree, withdisk }

                    let samenetwork =
                          { diskfree = [ InstanceType.m5n-4xlarge ] }

                    in  if    _params.permitWorseNetwork
                        then    worsenetwork.withdisk
                              # ( if    _params.permitLosingLocalDisk
                                  then    worsenetwork.diskfree
                                        # samenetwork.diskfree
                                  else  [] : List InstanceType
                                )
                        else  if _params.permitLosingLocalDisk
                        then  samenetwork.diskfree
                        else  [] : List InstanceType
                , r5-large = [ InstanceType.r5a-large, InstanceType.r5n-large ]
                , r5-xlarge =
                  [ InstanceType.r5a-xlarge, InstanceType.r5n-xlarge ]
                , r5-2xlarge =
                  [ InstanceType.r5a-2xlarge, InstanceType.r5n-2xlarge ]
                , r5-4xlarge =
                  [ InstanceType.r5a-4xlarge, InstanceType.r5n-4xlarge ]
                , r5a-large = [ InstanceType.r5-large, InstanceType.r5n-large ]
                , r5a-xlarge =
                  [ InstanceType.r5-xlarge, InstanceType.r5n-xlarge ]
                , r5a-2xlarge =
                  [ InstanceType.r5-2xlarge, InstanceType.r5n-2xlarge ]
                , r5a-4xlarge =
                  [ InstanceType.r5-4xlarge, InstanceType.r5n-4xlarge ]
                , r5n-large =
                    if    _params.permitWorseNetwork
                    then  [ InstanceType.r5-large, InstanceType.r5a-large ]
                    else  [] : List InstanceType
                , r5n-xlarge =
                    if    _params.permitWorseNetwork
                    then  [ InstanceType.r5-xlarge, InstanceType.r5a-xlarge ]
                    else  [] : List InstanceType
                , r5n-2xlarge =
                    if    _params.permitWorseNetwork
                    then  [ InstanceType.r5-2xlarge, InstanceType.r5a-2xlarge ]
                    else  [] : List InstanceType
                , r5n-4xlarge =
                    if    _params.permitWorseNetwork
                    then  [ InstanceType.r5-4xlarge, InstanceType.r5a-4xlarge ]
                    else  [] : List InstanceType
                , t3-nano =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-large
                              , InstanceType.c5d-large
                              , InstanceType.m5-large
                              , InstanceType.m5d-large
                              , InstanceType.m5n-large
                              , InstanceType.m5dn-large
                              , InstanceType.r5-large
                              , InstanceType.r5n-large
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-nano ]
                        else  [] : List InstanceType
                      )
                , t3-micro =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-large
                              , InstanceType.c5d-large
                              , InstanceType.m5-large
                              , InstanceType.m5d-large
                              , InstanceType.m5n-large
                              , InstanceType.m5dn-large
                              , InstanceType.r5-large
                              , InstanceType.r5n-large
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-micro ]
                        else  [] : List InstanceType
                      )
                , t3-small =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-large
                              , InstanceType.c5d-large
                              , InstanceType.m5-large
                              , InstanceType.m5d-large
                              , InstanceType.m5n-large
                              , InstanceType.m5dn-large
                              , InstanceType.r5-large
                              , InstanceType.r5n-large
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-small ]
                        else  [] : List InstanceType
                      )
                , t3-medium =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-large
                              , InstanceType.c5d-large
                              , InstanceType.m5-large
                              , InstanceType.m5d-large
                              , InstanceType.m5n-large
                              , InstanceType.m5dn-large
                              , InstanceType.r5-large
                              , InstanceType.r5n-large
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-medium ]
                        else  [] : List InstanceType
                      )
                , t3-large =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-xlarge
                              , InstanceType.c5d-xlarge
                              , InstanceType.m5-large
                              , InstanceType.m5d-large
                              , InstanceType.m5n-large
                              , InstanceType.m5dn-large
                              , InstanceType.r5-large
                              , InstanceType.r5n-large
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-large ]
                        else  [] : List InstanceType
                      )
                , t3-xlarge =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-2xlarge
                              , InstanceType.c5d-2xlarge
                              , InstanceType.m5-xlarge
                              , InstanceType.m5d-xlarge
                              , InstanceType.m5n-xlarge
                              , InstanceType.m5dn-xlarge
                              , InstanceType.r5-xlarge
                              , InstanceType.r5n-xlarge
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-xlarge ]
                        else  [] : List InstanceType
                      )
                , t3-2xlarge =
                      ( if    _params.permitCrossInstanceFamily
                        then  [ InstanceType.c5-4xlarge
                              , InstanceType.c5d-4xlarge
                              , InstanceType.m5-2xlarge
                              , InstanceType.m5d-2xlarge
                              , InstanceType.m5n-2xlarge
                              , InstanceType.m5dn-2xlarge
                              , InstanceType.r5-2xlarge
                              , InstanceType.r5n-2xlarge
                              ]
                        else  [] : List InstanceType
                      )
                    # ( if    _params.permitLowerClassCPU
                        then  [ InstanceType.t3a-2xlarge ]
                        else  [] : List InstanceType
                      )
                , t3a-nano =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-large
                          , InstanceType.c5d-large
                          , InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          , InstanceType.r5-large
                          , InstanceType.r5n-large
                          ]
                    else  [] : List InstanceType
                , t3a-micro =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-large
                          , InstanceType.c5d-large
                          , InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          , InstanceType.r5-large
                          , InstanceType.r5n-large
                          ]
                    else  [] : List InstanceType
                , t3a-small =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-large
                          , InstanceType.c5d-large
                          , InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          , InstanceType.r5-large
                          , InstanceType.r5n-large
                          ]
                    else  [] : List InstanceType
                , t3a-medium =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-large
                          , InstanceType.c5d-large
                          , InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          , InstanceType.r5-large
                          , InstanceType.r5n-large
                          ]
                    else  [] : List InstanceType
                , t3a-large =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-xlarge
                          , InstanceType.c5d-xlarge
                          , InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5n-large
                          , InstanceType.m5dn-large
                          , InstanceType.r5-large
                          , InstanceType.r5n-large
                          ]
                    else  [] : List InstanceType
                , t3a-xlarge =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-2xlarge
                          , InstanceType.c5d-2xlarge
                          , InstanceType.m5-xlarge
                          , InstanceType.m5d-xlarge
                          , InstanceType.m5n-xlarge
                          , InstanceType.m5dn-xlarge
                          , InstanceType.r5-xlarge
                          , InstanceType.r5n-xlarge
                          ]
                    else  [] : List InstanceType
                , t3a-2xlarge =
                    if    _params.permitCrossInstanceFamily
                    then  [ InstanceType.c5-4xlarge
                          , InstanceType.c5d-4xlarge
                          , InstanceType.m5-2xlarge
                          , InstanceType.m5d-2xlarge
                          , InstanceType.m5n-2xlarge
                          , InstanceType.m5dn-2xlarge
                          , InstanceType.r5-2xlarge
                          , InstanceType.r5n-2xlarge
                          ]
                    else  [] : List InstanceType
                }
                instanceType

      let tests =
            { samespecs =
                let common =
                      λ(spec : InstanceType → Natural) →
                        Prelude.List.all
                          InstanceType
                          ( λ(instanceType : InstanceType) →
                              let alternatives =
                                    alternatives
                                      Parameters::{
                                      , permitLowerClassCPU = True
                                      , permitWorseNetwork = True
                                      , permitLosingLocalDisk = True
                                      , permitCrossInstanceFamily = True
                                      , permitLowerEBSBandwidth = True
                                      }
                                      instanceType

                              in  Prelude.List.all
                                    InstanceType
                                    ( λ ( alternativeInstanceType
                                        : InstanceType
                                        ) →
                                        Prelude.Natural.lessThanEqual
                                          (spec instanceType)
                                          (spec alternativeInstanceType)
                                    )
                                    alternatives
                          )
                          test-util.all

                in  { cpu = assert : common specs.vCPU ≡ True
                    , memory = assert : common specs.memory ≡ True
                    }
            }

      in  { Parameters, function = alternatives }

in  alternatives
