let imports = ../../imports.dhall

let Prelude = imports.Prelude

let InstanceType = ./Type.dhall

let test-util = ./test-util.dhall

let specs = ./specs.dhall

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
                , c6g-medium = ./alternatives/c6g-medium.dhall _params
                , c6g-large = ./alternatives/c6g-large.dhall _params
                , c6g-xlarge = ./alternatives/c6g-xlarge.dhall _params
                , c6g-2xlarge = ./alternatives/c6g-2xlarge.dhall _params
                , c6g-4xlarge = ./alternatives/c6g-4xlarge.dhall _params
                , c6gd-medium = ./alternatives/c6gd-medium.dhall _params
                , c6gd-large = ./alternatives/c6gd-large.dhall _params
                , c6gd-xlarge = ./alternatives/c6gd-xlarge.dhall _params
                , c6gd-2xlarge = ./alternatives/c6gd-2xlarge.dhall _params
                , c6gd-4xlarge = ./alternatives/c6gd-4xlarge.dhall _params
                , c6gn-medium = ./alternatives/c6gn-medium.dhall _params
                , c6gn-large = ./alternatives/c6gn-large.dhall _params
                , c6gn-xlarge = ./alternatives/c6gn-xlarge.dhall _params
                , c6gn-2xlarge = ./alternatives/c6gn-2xlarge.dhall _params
                , c6gn-4xlarge = ./alternatives/c6gn-4xlarge.dhall _params
                , m4-large = ./alternatives/m4-large.dhall _params
                , m4-xlarge = ./alternatives/m4-xlarge.dhall _params
                , m4-2xlarge = ./alternatives/m4-2xlarge.dhall _params
                , m4-4xlarge = ./alternatives/m4-4xlarge.dhall _params
                , m5-large = ./alternatives/m5-large.dhall _params
                , m5-xlarge = ./alternatives/m5-xlarge.dhall _params
                , m5-2xlarge = ./alternatives/m5-2xlarge.dhall _params
                , m5-4xlarge = ./alternatives/m5-4xlarge.dhall _params
                , m5d-large = ./alternatives/m5d-large.dhall _params
                , m5d-xlarge = ./alternatives/m5d-xlarge.dhall _params
                , m5d-2xlarge = ./alternatives/m5d-2xlarge.dhall _params
                , m5d-4xlarge = ./alternatives/m5d-4xlarge.dhall _params
                , m5a-large = ./alternatives/m5a-large.dhall _params
                , m5a-xlarge = ./alternatives/m5a-xlarge.dhall _params
                , m5a-2xlarge = ./alternatives/m5a-2xlarge.dhall _params
                , m5a-4xlarge = ./alternatives/m5a-4xlarge.dhall _params
                , m5ad-large = ./alternatives/m5ad-large.dhall _params
                , m5ad-xlarge = ./alternatives/m5ad-xlarge.dhall _params
                , m5ad-2xlarge = ./alternatives/m5ad-2xlarge.dhall _params
                , m5ad-4xlarge = ./alternatives/m5ad-4xlarge.dhall _params
                , m5n-large = ./alternatives/m5n-large.dhall _params
                , m5n-xlarge = ./alternatives/m5n-xlarge.dhall _params
                , m5n-2xlarge = ./alternatives/m5n-2xlarge.dhall _params
                , m5n-4xlarge = ./alternatives/m5n-4xlarge.dhall _params
                , m5dn-large = ./alternatives/m5dn-large.dhall _params
                , m5dn-xlarge = ./alternatives/m5dn-xlarge.dhall _params
                , m5dn-2xlarge = ./alternatives/m5dn-2xlarge.dhall _params
                , m5dn-4xlarge = ./alternatives/m5dn-4xlarge.dhall _params
                , m6g-medium = ./alternatives/m6g-medium.dhall _params
                , m6g-large = ./alternatives/m6g-large.dhall _params
                , m6g-xlarge = ./alternatives/m6g-xlarge.dhall _params
                , m6g-2xlarge = ./alternatives/m6g-2xlarge.dhall _params
                , m6g-4xlarge = ./alternatives/m6g-4xlarge.dhall _params
                , m6gd-medium = ./alternatives/m6gd-medium.dhall _params
                , m6gd-large = ./alternatives/m6gd-large.dhall _params
                , m6gd-xlarge = ./alternatives/m6gd-xlarge.dhall _params
                , m6gd-2xlarge = ./alternatives/m6gd-2xlarge.dhall _params
                , m6gd-4xlarge = ./alternatives/m6gd-4xlarge.dhall _params
                , r5-large = ./alternatives/r5-large.dhall
                , r5-xlarge = ./alternatives/r5-xlarge.dhall
                , r5-2xlarge = ./alternatives/r5-2xlarge.dhall
                , r5-4xlarge = ./alternatives/r5-4xlarge.dhall
                , r5a-large = ./alternatives/r5a-large.dhall
                , r5a-xlarge = ./alternatives/r5a-xlarge.dhall
                , r5a-2xlarge = ./alternatives/r5a-2xlarge.dhall
                , r5a-4xlarge = ./alternatives/r5a-4xlarge.dhall
                , r5n-large = ./alternatives/r5n-large.dhall _params
                , r5n-xlarge = ./alternatives/r5n-xlarge.dhall _params
                , r5n-2xlarge = ./alternatives/r5n-2xlarge.dhall _params
                , r5n-4xlarge = ./alternatives/r5n-4xlarge.dhall _params
                , r6g-medium = ./alternatives/r6g-medium.dhall _params
                , r6g-large = ./alternatives/r6g-large.dhall _params
                , r6g-xlarge = ./alternatives/r6g-xlarge.dhall _params
                , r6g-2xlarge = ./alternatives/r6g-2xlarge.dhall _params
                , r6g-4xlarge = ./alternatives/r6g-4xlarge.dhall _params
                , r6gd-medium = ./alternatives/r6gd-medium.dhall _params
                , r6gd-large = ./alternatives/r6gd-large.dhall _params
                , r6gd-xlarge = ./alternatives/r6gd-xlarge.dhall _params
                , r6gd-2xlarge = ./alternatives/r6gd-2xlarge.dhall _params
                , r6gd-4xlarge = ./alternatives/r6gd-4xlarge.dhall _params
                , t3-nano = ./alternatives/t3-nano.dhall _params
                , t3-micro = ./alternatives/t3-micro.dhall _params
                , t3-small = ./alternatives/t3-small.dhall _params
                , t3-medium = ./alternatives/t3-medium.dhall _params
                , t3-large = ./alternatives/t3-large.dhall _params
                , t3-xlarge = ./alternatives/t3-xlarge.dhall _params
                , t3-2xlarge = ./alternatives/t3-2xlarge.dhall _params
                , t3a-nano = ./alternatives/t3a-nano.dhall _params
                , t3a-micro = ./alternatives/t3a-micro.dhall _params
                , t3a-small = ./alternatives/t3a-small.dhall _params
                , t3a-medium = ./alternatives/t3a-medium.dhall _params
                , t3a-large = ./alternatives/t3a-large.dhall _params
                , t3a-xlarge = ./alternatives/t3a-xlarge.dhall _params
                , t3a-2xlarge = ./alternatives/t3a-2xlarge.dhall _params
                , t4g-nano = ./alternatives/t4g-nano.dhall _params
                , t4g-micro = ./alternatives/t4g-micro.dhall _params
                , t4g-small = ./alternatives/t4g-small.dhall _params
                , t4g-medium = ./alternatives/t4g-medium.dhall _params
                , t4g-large = ./alternatives/t4g-large.dhall _params
                , t4g-xlarge = ./alternatives/t4g-xlarge.dhall _params
                , t4g-2xlarge = ./alternatives/t4g-2xlarge.dhall _params
                , x2gd-medium = ./alternatives/x2gd-medium.dhall _params
                , x2gd-large = ./alternatives/x2gd-large.dhall _params
                , x2gd-xlarge = ./alternatives/x2gd-xlarge.dhall _params
                , x2gd-2xlarge = ./alternatives/x2gd-2xlarge.dhall _params
                , x2gd-4xlarge = ./alternatives/x2gd-4xlarge.dhall _params
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
