let imports = ../imports.dhall

let Prelude = imports.Prelude

let InstanceType =
    {-
    The list is sorted in alphabetical order by instance family
    -}
      < c5-large
      | c5-xlarge
      | c5-2xlarge
      | c5-4xlarge
      | c5a-large
      | c5a-xlarge
      | c5a-2xlarge
      | c5a-4xlarge
      | c5d-large
      | c5d-xlarge
      | c5d-2xlarge
      | c5d-4xlarge
      | c5n-large
      | c5n-xlarge
      | c5n-2xlarge
      | c5n-4xlarge
      | m4-large
      | m4-xlarge
      | m4-2xlarge
      | m4-4xlarge
      | m5-large
      | m5-xlarge
      | m5-2xlarge
      | m5-4xlarge
      | m5a-large
      | m5a-xlarge
      | m5a-2xlarge
      | m5a-4xlarge
      | m5ad-large
      | m5ad-xlarge
      | m5ad-2xlarge
      | m5ad-4xlarge
      | m5d-large
      | m5d-xlarge
      | m5d-2xlarge
      | m5d-4xlarge
      | m5dn-large
      | m5dn-xlarge
      | m5dn-2xlarge
      | m5dn-4xlarge
      | m5n-large
      | m5n-xlarge
      | m5n-2xlarge
      | m5n-4xlarge
      | r5-large
      | r5-xlarge
      | r5-2xlarge
      | r5-4xlarge
      | r5a-large
      | r5a-xlarge
      | r5a-2xlarge
      | r5a-4xlarge
      | r5n-large
      | r5n-xlarge
      | r5n-2xlarge
      | r5n-4xlarge
      | t3-nano
      | t3-micro
      | t3-small
      | t3-medium
      | t3-large
      | t3-xlarge
      | t3-2xlarge
      | t3a-nano
      | t3a-micro
      | t3a-small
      | t3a-medium
      | t3a-large
      | t3a-xlarge
      | t3a-2xlarge
      >

let test-util =
      { all =
        [ InstanceType.c5-large
        , InstanceType.c5-xlarge
        , InstanceType.c5-2xlarge
        , InstanceType.c5-4xlarge
        , InstanceType.c5a-large
        , InstanceType.c5a-xlarge
        , InstanceType.c5a-2xlarge
        , InstanceType.c5a-4xlarge
        , InstanceType.c5d-large
        , InstanceType.c5d-xlarge
        , InstanceType.c5d-2xlarge
        , InstanceType.c5d-4xlarge
        , InstanceType.c5n-large
        , InstanceType.c5n-xlarge
        , InstanceType.c5n-2xlarge
        , InstanceType.c5n-4xlarge
        , InstanceType.m4-large
        , InstanceType.m4-xlarge
        , InstanceType.m4-2xlarge
        , InstanceType.m4-4xlarge
        , InstanceType.m5-large
        , InstanceType.m5-xlarge
        , InstanceType.m5-2xlarge
        , InstanceType.m5-4xlarge
        , InstanceType.m5a-large
        , InstanceType.m5a-xlarge
        , InstanceType.m5a-2xlarge
        , InstanceType.m5a-4xlarge
        , InstanceType.m5ad-large
        , InstanceType.m5ad-xlarge
        , InstanceType.m5ad-2xlarge
        , InstanceType.m5ad-4xlarge
        , InstanceType.m5d-large
        , InstanceType.m5d-xlarge
        , InstanceType.m5d-2xlarge
        , InstanceType.m5d-4xlarge
        , InstanceType.m5dn-large
        , InstanceType.m5dn-xlarge
        , InstanceType.m5dn-2xlarge
        , InstanceType.m5dn-4xlarge
        , InstanceType.m5n-large
        , InstanceType.m5n-xlarge
        , InstanceType.m5n-2xlarge
        , InstanceType.m5n-4xlarge
        , InstanceType.r5-large
        , InstanceType.r5-xlarge
        , InstanceType.r5-2xlarge
        , InstanceType.r5-4xlarge
        , InstanceType.r5a-large
        , InstanceType.r5a-xlarge
        , InstanceType.r5a-2xlarge
        , InstanceType.r5a-4xlarge
        , InstanceType.r5n-large
        , InstanceType.r5n-xlarge
        , InstanceType.r5n-2xlarge
        , InstanceType.r5n-4xlarge
        , InstanceType.t3-nano
        , InstanceType.t3-micro
        , InstanceType.t3-small
        , InstanceType.t3-medium
        , InstanceType.t3-large
        , InstanceType.t3-xlarge
        , InstanceType.t3-2xlarge
        , InstanceType.t3a-nano
        , InstanceType.t3a-micro
        , InstanceType.t3a-small
        , InstanceType.t3a-medium
        , InstanceType.t3a-large
        , InstanceType.t3a-xlarge
        , InstanceType.t3a-2xlarge
        ]
      }

let render
    : InstanceType → Text
    = λ(instanceType : InstanceType) →
        merge
          { c5-large = "c5.large"
          , c5-xlarge = "c5.xlarge"
          , c5-2xlarge = "c5.2xlarge"
          , c5-4xlarge = "c5.4xlarge"
          , c5a-large = "c5a.large"
          , c5a-xlarge = "c5a.xlarge"
          , c5a-2xlarge = "c5a.2xlarge"
          , c5a-4xlarge = "c5a.4xlarge"
          , c5d-large = "c5d.large"
          , c5d-xlarge = "c5d.xlarge"
          , c5d-2xlarge = "c5d.2xlarge"
          , c5d-4xlarge = "c5d.4xlarge"
          , c5n-large = "c5n.large"
          , c5n-xlarge = "c5n.xlarge"
          , c5n-2xlarge = "c5n.2xlarge"
          , c5n-4xlarge = "c5n.4xlarge"
          , m4-large = "m4.large"
          , m4-xlarge = "m4.xlarge"
          , m4-2xlarge = "m4.2xlarge"
          , m4-4xlarge = "m4.4xlarge"
          , m5-large = "m5.large"
          , m5-xlarge = "m5.xlarge"
          , m5-2xlarge = "m5.2xlarge"
          , m5-4xlarge = "m5.4xlarge"
          , m5d-large = "m5d.large"
          , m5d-xlarge = "m5d.xlarge"
          , m5d-2xlarge = "m5d.2xlarge"
          , m5d-4xlarge = "m5d.4xlarge"
          , m5a-large = "m5a.large"
          , m5a-xlarge = "m5a.xlarge"
          , m5a-2xlarge = "m5a.2xlarge"
          , m5a-4xlarge = "m5a.4xlarge"
          , m5ad-large = "m5ad.large"
          , m5ad-xlarge = "m5ad.xlarge"
          , m5ad-2xlarge = "m5ad.2xlarge"
          , m5ad-4xlarge = "m5ad.4xlarge"
          , m5n-large = "m5n.large"
          , m5n-xlarge = "m5n.xlarge"
          , m5n-2xlarge = "m5n.2xlarge"
          , m5n-4xlarge = "m5n.4xlarge"
          , m5dn-large = "m5dn.large"
          , m5dn-xlarge = "m5dn.xlarge"
          , m5dn-2xlarge = "m5dn.2xlarge"
          , m5dn-4xlarge = "m5dn.4xlarge"
          , r5-large = "r5.large"
          , r5-xlarge = "r5.xlarge"
          , r5-2xlarge = "r5.2xlarge"
          , r5-4xlarge = "r5.4xlarge"
          , r5a-large = "r5a.large"
          , r5a-xlarge = "r5a.xlarge"
          , r5a-2xlarge = "r5a.2xlarge"
          , r5a-4xlarge = "r5a.4xlarge"
          , r5n-large = "r5n.large"
          , r5n-xlarge = "r5n.xlarge"
          , r5n-2xlarge = "r5n.2xlarge"
          , r5n-4xlarge = "r5n.4xlarge"
          , t3-nano = "t3.nano"
          , t3-micro = "t3.micro"
          , t3-small = "t3.small"
          , t3-medium = "t3.medium"
          , t3-large = "t3.large"
          , t3-xlarge = "t3.xlarge"
          , t3-2xlarge = "t3.2xlarge"
          , t3a-nano = "t3a.nano"
          , t3a-micro = "t3a.micro"
          , t3a-small = "t3a.small"
          , t3a-medium = "t3a.medium"
          , t3a-large = "t3a.large"
          , t3a-xlarge = "t3a.xlarge"
          , t3a-2xlarge = "t3a.2xlarge"
          }
          instanceType

let specs =
      { vCPU =
          let vCPU
              : InstanceType → Natural
              = λ(instanceType : InstanceType) →
                  merge
                    { c5-large = 2
                    , c5-xlarge = 4
                    , c5-2xlarge = 8
                    , c5-4xlarge = 16
                    , c5a-large = 2
                    , c5a-xlarge = 4
                    , c5a-2xlarge = 8
                    , c5a-4xlarge = 16
                    , c5d-large = 2
                    , c5d-xlarge = 4
                    , c5d-2xlarge = 8
                    , c5d-4xlarge = 16
                    , c5n-large = 2
                    , c5n-xlarge = 4
                    , c5n-2xlarge = 8
                    , c5n-4xlarge = 16
                    , m4-large = 2
                    , m4-xlarge = 4
                    , m4-2xlarge = 8
                    , m4-4xlarge = 16
                    , m5-large = 2
                    , m5-xlarge = 4
                    , m5-2xlarge = 8
                    , m5-4xlarge = 16
                    , m5d-large = 2
                    , m5d-xlarge = 4
                    , m5d-2xlarge = 8
                    , m5d-4xlarge = 16
                    , m5a-large = 2
                    , m5a-xlarge = 4
                    , m5a-2xlarge = 8
                    , m5a-4xlarge = 16
                    , m5ad-large = 2
                    , m5ad-xlarge = 4
                    , m5ad-2xlarge = 8
                    , m5ad-4xlarge = 16
                    , m5n-large = 2
                    , m5n-xlarge = 4
                    , m5n-2xlarge = 8
                    , m5n-4xlarge = 16
                    , m5dn-large = 2
                    , m5dn-xlarge = 4
                    , m5dn-2xlarge = 8
                    , m5dn-4xlarge = 16
                    , r5-large = 2
                    , r5-xlarge = 4
                    , r5-2xlarge = 8
                    , r5-4xlarge = 16
                    , r5a-large = 2
                    , r5a-xlarge = 4
                    , r5a-2xlarge = 8
                    , r5a-4xlarge = 16
                    , r5n-large = 2
                    , r5n-xlarge = 4
                    , r5n-2xlarge = 8
                    , r5n-4xlarge = 16
                    , t3-nano = 2
                    , t3-micro = 2
                    , t3-small = 2
                    , t3-medium = 2
                    , t3-large = 2
                    , t3-xlarge = 4
                    , t3-2xlarge = 8
                    , t3a-nano = 2
                    , t3a-micro = 2
                    , t3a-small = 2
                    , t3a-medium = 2
                    , t3a-large = 2
                    , t3a-xlarge = 4
                    , t3a-2xlarge = 8
                    }
                    instanceType

          in  vCPU
      , memory =
          let memory
              : InstanceType → Natural
              = λ(instanceType : InstanceType) →
                  merge
                    { c5-large = 4000
                    , c5-xlarge = 8000
                    , c5-2xlarge = 16000
                    , c5-4xlarge = 32000
                    , c5a-large = 4000
                    , c5a-xlarge = 8000
                    , c5a-2xlarge = 16000
                    , c5a-4xlarge = 32000
                    , c5d-large = 4000
                    , c5d-xlarge = 8000
                    , c5d-2xlarge = 16000
                    , c5d-4xlarge = 32000
                    , c5n-large = 5250
                    , c5n-xlarge = 10500
                    , c5n-2xlarge = 21000
                    , c5n-4xlarge = 42000
                    , m4-large = 8000
                    , m4-xlarge = 16000
                    , m4-2xlarge = 32000
                    , m4-4xlarge = 64000
                    , m5-large = 8000
                    , m5-xlarge = 16000
                    , m5-2xlarge = 32000
                    , m5-4xlarge = 64000
                    , m5d-large = 8000
                    , m5d-xlarge = 16000
                    , m5d-2xlarge = 32000
                    , m5d-4xlarge = 64000
                    , m5a-large = 8000
                    , m5a-xlarge = 16000
                    , m5a-2xlarge = 32000
                    , m5a-4xlarge = 64000
                    , m5ad-large = 8000
                    , m5ad-xlarge = 16000
                    , m5ad-2xlarge = 32000
                    , m5ad-4xlarge = 64000
                    , m5n-large = 8000
                    , m5n-xlarge = 16000
                    , m5n-2xlarge = 32000
                    , m5n-4xlarge = 64000
                    , m5dn-large = 8000
                    , m5dn-xlarge = 16000
                    , m5dn-2xlarge = 32000
                    , m5dn-4xlarge = 64000
                    , r5-large = 16000
                    , r5-xlarge = 32000
                    , r5-2xlarge = 64000
                    , r5-4xlarge = 128000
                    , r5a-large = 16000
                    , r5a-xlarge = 32000
                    , r5a-2xlarge = 64000
                    , r5a-4xlarge = 128000
                    , r5n-large = 16000
                    , r5n-xlarge = 32000
                    , r5n-2xlarge = 64000
                    , r5n-4xlarge = 128000
                    , t3-nano = 500
                    , t3-micro = 1000
                    , t3-small = 2000
                    , t3-medium = 4000
                    , t3-large = 8000
                    , t3-xlarge = 16000
                    , t3-2xlarge = 32000
                    , t3a-nano = 500
                    , t3a-micro = 1000
                    , t3a-small = 2000
                    , t3a-medium = 4000
                    , t3a-large = 8000
                    , t3a-xlarge = 16000
                    , t3a-2xlarge = 32000
                    }
                    instanceType

          in  memory
      }

let alternatives =
      let Parameters =
            { Type =
                { permitLowerClassCPU : Bool
                , permitWorseNetwork : Bool
                , permitLowerEBSBandwidth : Bool
                , permitLosingLocalDisk : Bool
                , permitCrossInstanceFamily : Bool
                }
            , default = {=}
            }

      let alternatives
          : Parameters.Type → InstanceType → List InstanceType
          = λ(_params : Parameters.Type) →
            λ(instanceType : InstanceType) →
              merge
                { c5-large =
                    let cross-instances =
                          let lowClass =

                              {-
                                lowClass - all instance types that have lower ECU and lower network performance
                                  -}
                                [ InstanceType.m4-large ]

                          in    [ InstanceType.m5-large, InstanceType.r5-large ]
                              # ( if        _params.permitLowerClassCPU
                                        &&  _params.permitWorseNetwork
                                        &&  _params.permitLowerEBSBandwidth
                                  then  lowClass
                                  else  [] : List InstanceType
                                )

                    let instancefamily =
                          let lowDiskBandwidth =

                              {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                                [ InstanceType.c5a-large ]

                          in    [ InstanceType.c5d-large
                                , InstanceType.c5n-large
                                ]
                              # ( if    _params.permitLowerEBSBandwidth
                                  then  lowDiskBandwidth
                                  else  [] : List InstanceType
                                )

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5-xlarge =
                    let cross-instances =
                          let lowClass =

                              {-
                                lowClass - all instance types that have lower ECU and lower network performance
                                  -}
                                [ InstanceType.m4-xlarge ]

                          in    [ InstanceType.m5-xlarge
                                , InstanceType.r5-xlarge
                                ]
                              # ( if        _params.permitLowerClassCPU
                                        &&  _params.permitWorseNetwork
                                        &&  _params.permitLowerEBSBandwidth
                                  then  lowClass
                                  else  [] : List InstanceType
                                )

                    let instancefamily =
                          let lowDiskBandwidth =

                              {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                                [ InstanceType.c5a-xlarge ]

                          in    [ InstanceType.c5d-xlarge
                                , InstanceType.c5n-xlarge
                                ]
                              # ( if    _params.permitLowerEBSBandwidth
                                  then  lowDiskBandwidth
                                  else  [] : List InstanceType
                                )

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5-2xlarge =
                    let cross-instances =
                          let lowClass =

                              {-
                                lowClass - all instance types that have lower ECU and lower network performance
                                  -}
                                [ InstanceType.m4-2xlarge ]

                          in    [ InstanceType.m5-2xlarge
                                , InstanceType.r5-2xlarge
                                ]
                              # ( if        _params.permitLowerClassCPU
                                        &&  _params.permitWorseNetwork
                                        &&  _params.permitLowerEBSBandwidth
                                  then  lowClass
                                  else  [] : List InstanceType
                                )

                    let instancefamily =
                          let lowDiskBandwidth =

                              {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                                [ InstanceType.c5a-2xlarge ]

                          in    [ InstanceType.c5d-2xlarge
                                , InstanceType.c5n-2xlarge
                                ]
                              # ( if    _params.permitLowerEBSBandwidth
                                  then  lowDiskBandwidth
                                  else  [] : List InstanceType
                                )

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5-4xlarge =
                    let cross-instances =
                          let lowClass =

                              {-
                                lowClass - all instance types that have lower ECU and lower network performance
                                  -}
                                [ InstanceType.m4-4xlarge ]

                          in    [ InstanceType.m5-4xlarge
                                , InstanceType.r5-4xlarge
                                ]
                              # ( if        _params.permitLowerClassCPU
                                        &&  _params.permitWorseNetwork
                                        &&  _params.permitLowerEBSBandwidth
                                  then  lowClass
                                  else  [] : List InstanceType
                                )

                    let instancefamily =
                          let lowDiskBandwidth =

                              {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}

                                [ InstanceType.c5a-4xlarge ]

                          in    [ InstanceType.c5d-4xlarge
                                , InstanceType.c5n-4xlarge
                                ]
                              # ( if    _params.permitLowerEBSBandwidth
                                  then  lowDiskBandwidth
                                  else  [] : List InstanceType
                                )

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5a-large =
                    let cross-instances =
                          [ InstanceType.m5a-large, InstanceType.r5a-large ]

                    let instancefamily =
                          [ InstanceType.c5-large
                          , InstanceType.c5d-large
                          , InstanceType.c5n-large
                          ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5a-xlarge =
                    let cross-instances =
                          [ InstanceType.m5a-xlarge, InstanceType.r5a-xlarge ]

                    let instancefamily =
                          [ InstanceType.c5-xlarge
                          , InstanceType.c5d-xlarge
                          , InstanceType.c5n-xlarge
                          ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5a-2xlarge =
                    let cross-instances =
                          [ InstanceType.m5a-2xlarge, InstanceType.r5a-2xlarge ]

                    let instancefamily =
                          [ InstanceType.c5-2xlarge
                          , InstanceType.c5d-2xlarge
                          , InstanceType.c5n-2xlarge
                          ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5a-4xlarge =
                    let cross-instances =
                          [ InstanceType.m5a-4xlarge, InstanceType.r5a-4xlarge ]

                    let instancefamily =
                          [ InstanceType.c5-4xlarge
                          , InstanceType.c5d-4xlarge
                          , InstanceType.c5n-4xlarge
                          ]

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5d-large =
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
                                    # [ InstanceType.c5-large
                                      , InstanceType.c5n-large
                                      ]

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
                , c5d-xlarge =
                    let cross-instances = [ InstanceType.m5d-xlarge ]

                    let instancefamily =
                          let diskfree =
                              {- diskfree - an instance type with no local disk -}
                                let lowDiskBandwidth =
                                    {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}
                                      [ InstanceType.c5a-xlarge ]

                                in    ( if    _params.permitLowerEBSBandwidth
                                        then  lowDiskBandwidth
                                        else  [] : List InstanceType
                                      )
                                    # [ InstanceType.c5-xlarge
                                      , InstanceType.c5n-xlarge
                                      ]

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
                , c5d-2xlarge =
                    let cross-instances = [ InstanceType.m5d-2xlarge ]

                    let instancefamily =
                          let diskfree =
                              {- diskfree - an instance type with no local disk -}
                                let lowDiskBandwidth =
                                    {- lowDiskBandwidth - an instance type with low EBS disk bandwidth -}
                                      [ InstanceType.c5a-2xlarge ]

                                in    ( if    _params.permitLowerEBSBandwidth
                                        then  lowDiskBandwidth
                                        else  [] : List InstanceType
                                      )
                                    # [ InstanceType.c5-2xlarge
                                      , InstanceType.c5n-2xlarge
                                      ]

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
                , c5d-4xlarge =
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
                                    # [ InstanceType.c5-4xlarge
                                      , InstanceType.c5n-4xlarge
                                      ]

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
                , c5n-large =
                    let cross-instances =
                          [ InstanceType.m5n-large, InstanceType.r5n-large ]

                    let instancefamily = [] : List InstanceType

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5n-xlarge =
                    let cross-instances =
                          [ InstanceType.m5n-xlarge, InstanceType.r5n-xlarge ]

                    let instancefamily = [] : List InstanceType

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5n-2xlarge =
                    let cross-instances =
                          [ InstanceType.m5n-2xlarge, InstanceType.r5n-2xlarge ]

                    let instancefamily = [] : List InstanceType

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , c5n-4xlarge =
                    let cross-instances =
                          [ InstanceType.m5n-4xlarge, InstanceType.r5n-4xlarge ]

                    let instancefamily = [] : List InstanceType

                    in    instancefamily
                        # ( if    _params.permitCrossInstanceFamily
                            then  cross-instances
                            else  [] : List InstanceType
                          )
                , m4-large =
                    let instancefamily =
                          [ InstanceType.m5-large
                          , InstanceType.m5d-large
                          , InstanceType.m5a-large
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
                , m4-xlarge =
                    let instancefamily =
                          [ InstanceType.m5-xlarge
                          , InstanceType.m5d-xlarge
                          , InstanceType.m5a-xlarge
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

let upsize
    : InstanceType → Optional InstanceType
    = λ(instanceType : InstanceType) →
        merge
          { c5-large = Some InstanceType.c5-xlarge
          , c5-xlarge = Some InstanceType.c5-2xlarge
          , c5-2xlarge = Some InstanceType.c5-4xlarge
          , c5-4xlarge = None InstanceType
          , c5a-large = Some InstanceType.c5a-xlarge
          , c5a-xlarge = Some InstanceType.c5a-2xlarge
          , c5a-2xlarge = Some InstanceType.c5a-4xlarge
          , c5a-4xlarge = None InstanceType
          , c5d-large = Some InstanceType.c5d-xlarge
          , c5d-xlarge = Some InstanceType.c5d-2xlarge
          , c5d-2xlarge = Some InstanceType.c5d-4xlarge
          , c5d-4xlarge = None InstanceType
          , c5n-large = Some InstanceType.c5n-xlarge
          , c5n-xlarge = Some InstanceType.c5n-2xlarge
          , c5n-2xlarge = Some InstanceType.c5n-4xlarge
          , c5n-4xlarge = None InstanceType
          , m4-large = Some InstanceType.m4-xlarge
          , m4-xlarge = Some InstanceType.m4-2xlarge
          , m4-2xlarge = Some InstanceType.m4-4xlarge
          , m4-4xlarge = None InstanceType
          , m5-large = Some InstanceType.m5-xlarge
          , m5-xlarge = Some InstanceType.m5-2xlarge
          , m5-2xlarge = Some InstanceType.m5-4xlarge
          , m5-4xlarge = None InstanceType
          , m5d-large = Some InstanceType.m5d-xlarge
          , m5d-xlarge = Some InstanceType.m5d-2xlarge
          , m5d-2xlarge = Some InstanceType.m5d-4xlarge
          , m5d-4xlarge = None InstanceType
          , m5a-large = Some InstanceType.m5a-xlarge
          , m5a-xlarge = Some InstanceType.m5a-2xlarge
          , m5a-2xlarge = Some InstanceType.m5a-4xlarge
          , m5a-4xlarge = None InstanceType
          , m5ad-large = Some InstanceType.m5ad-xlarge
          , m5ad-xlarge = Some InstanceType.m5ad-2xlarge
          , m5ad-2xlarge = Some InstanceType.m5ad-4xlarge
          , m5ad-4xlarge = None InstanceType
          , m5n-large = Some InstanceType.m5n-xlarge
          , m5n-xlarge = Some InstanceType.m5n-2xlarge
          , m5n-2xlarge = Some InstanceType.m5n-4xlarge
          , m5n-4xlarge = None InstanceType
          , m5dn-large = Some InstanceType.m5dn-xlarge
          , m5dn-xlarge = Some InstanceType.m5dn-2xlarge
          , m5dn-2xlarge = Some InstanceType.m5dn-4xlarge
          , m5dn-4xlarge = None InstanceType
          , r5-large = Some InstanceType.r5-xlarge
          , r5-xlarge = Some InstanceType.r5-2xlarge
          , r5-2xlarge = Some InstanceType.r5-4xlarge
          , r5-4xlarge = None InstanceType
          , r5a-large = Some InstanceType.r5a-xlarge
          , r5a-xlarge = Some InstanceType.r5a-2xlarge
          , r5a-2xlarge = Some InstanceType.r5a-4xlarge
          , r5a-4xlarge = None InstanceType
          , r5n-large = Some InstanceType.r5n-xlarge
          , r5n-xlarge = Some InstanceType.r5n-2xlarge
          , r5n-2xlarge = Some InstanceType.r5n-4xlarge
          , r5n-4xlarge = None InstanceType
          , t3-nano = Some InstanceType.t3-micro
          , t3-micro = Some InstanceType.t3-small
          , t3-small = Some InstanceType.t3-medium
          , t3-medium = Some InstanceType.t3-large
          , t3-large = Some InstanceType.t3-xlarge
          , t3-xlarge = Some InstanceType.t3-2xlarge
          , t3-2xlarge = None InstanceType
          , t3a-nano = Some InstanceType.t3a-micro
          , t3a-micro = Some InstanceType.t3a-small
          , t3a-small = Some InstanceType.t3a-medium
          , t3a-medium = Some InstanceType.t3a-large
          , t3a-large = Some InstanceType.t3a-xlarge
          , t3a-xlarge = Some InstanceType.t3a-2xlarge
          , t3a-2xlarge = None InstanceType
          }
          instanceType

in  { Type = InstanceType
    , render
    , upsize
    , specs
    , alternatives
    , c5-large = InstanceType.c5-large
    , c5-xlarge = InstanceType.c5-xlarge
    , c5-2xlarge = InstanceType.c5-2xlarge
    , c5-4xlarge = InstanceType.c5-4xlarge
    , c5a-large = InstanceType.c5a-large
    , c5a-xlarge = InstanceType.c5a-xlarge
    , c5a-2xlarge = InstanceType.c5a-2xlarge
    , c5a-4xlarge = InstanceType.c5a-4xlarge
    , c5d-large = InstanceType.c5d-large
    , c5d-xlarge = InstanceType.c5d-xlarge
    , c5d-2xlarge = InstanceType.c5d-2xlarge
    , c5d-4xlarge = InstanceType.c5d-4xlarge
    , c5n-large = InstanceType.c5n-large
    , c5n-xlarge = InstanceType.c5n-xlarge
    , c5n-2xlarge = InstanceType.c5n-2xlarge
    , c5n-4xlarge = InstanceType.c5n-4xlarge
    , m4-large = InstanceType.m4-large
    , m4-xlarge = InstanceType.m4-xlarge
    , m4-2xlarge = InstanceType.m4-2xlarge
    , m4-4xlarge = InstanceType.m4-4xlarge
    , m5-large = InstanceType.m5-large
    , m5-xlarge = InstanceType.m5-xlarge
    , m5-2xlarge = InstanceType.m5-2xlarge
    , m5-4xlarge = InstanceType.m5-4xlarge
    , m5d-large = InstanceType.m5d-large
    , m5d-xlarge = InstanceType.m5d-xlarge
    , m5d-2xlarge = InstanceType.m5d-2xlarge
    , m5d-4xlarge = InstanceType.m5d-4xlarge
    , m5a-large = InstanceType.m5a-large
    , m5a-xlarge = InstanceType.m5a-xlarge
    , m5a-2xlarge = InstanceType.m5a-2xlarge
    , m5a-4xlarge = InstanceType.m5a-4xlarge
    , m5ad-large = InstanceType.m5ad-large
    , m5ad-xlarge = InstanceType.m5ad-xlarge
    , m5ad-2xlarge = InstanceType.m5ad-2xlarge
    , m5ad-4xlarge = InstanceType.m5ad-4xlarge
    , m5n-large = InstanceType.m5n-large
    , m5n-xlarge = InstanceType.m5n-xlarge
    , m5n-2xlarge = InstanceType.m5n-2xlarge
    , m5n-4xlarge = InstanceType.m5n-4xlarge
    , m5dn-large = InstanceType.m5dn-large
    , m5dn-xlarge = InstanceType.m5dn-xlarge
    , m5dn-2xlarge = InstanceType.m5dn-2xlarge
    , m5dn-4xlarge = InstanceType.m5dn-4xlarge
    , r5-large = InstanceType.r5-large
    , r5-xlarge = InstanceType.r5-xlarge
    , r5-2xlarge = InstanceType.r5-2xlarge
    , r5-4xlarge = InstanceType.r5-4xlarge
    , r5a-large = InstanceType.r5a-large
    , r5a-xlarge = InstanceType.r5a-xlarge
    , r5a-2xlarge = InstanceType.r5a-2xlarge
    , r5a-4xlarge = InstanceType.r5a-4xlarge
    , r5n-large = InstanceType.r5n-large
    , r5n-xlarge = InstanceType.r5n-xlarge
    , r5n-2xlarge = InstanceType.r5n-2xlarge
    , r5n-4xlarge = InstanceType.r5n-4xlarge
    , t3-nano = InstanceType.t3-nano
    , t3-micro = InstanceType.t3-micro
    , t3-small = InstanceType.t3-small
    , t3-medium = InstanceType.t3-medium
    , t3-large = InstanceType.t3-large
    , t3-xlarge = InstanceType.t3-xlarge
    , t3-2xlarge = InstanceType.t3-2xlarge
    , t3a-nano = InstanceType.t3a-nano
    , t3a-micro = InstanceType.t3a-micro
    , t3a-small = InstanceType.t3a-small
    , t3a-medium = InstanceType.t3a-medium
    , t3a-large = InstanceType.t3a-large
    , t3a-xlarge = InstanceType.t3a-xlarge
    , t3a-2xlarge = InstanceType.t3a-2xlarge
    }
