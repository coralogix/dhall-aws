let Region =
      < af-south-1
      | ap-east-1
      | ap-northeast-1
      | ap-northeast-2
      | ap-northeast-3
      | ap-south-1
      | ap-southeast-1
      | ap-southeast-2
      | ca-central-1
      | cn-north-1
      | cn-northwest-1
      | eu-central-1
      | eu-north-1
      | eu-south-1
      | eu-west-1
      | eu-west-2
      | eu-west-3
      | me-south-1
      | sa-east-1
      | us-gov-east-1
      | us-gov-west-1
      | us-east-1
      | us-east-2
      | us-west-1
      | us-west-2
      >

let render =
      { computer =
          let render
              : Region → Text
              = λ(region : Region) →
                  merge
                    { af-south-1 = "af-south-1"
                    , ap-east-1 = "ap-east-1"
                    , ap-northeast-1 = "ap-northeast-1"
                    , ap-northeast-2 = "ap-northeast-2"
                    , ap-northeast-3 = "ap-northeast-3"
                    , ap-south-1 = "ap-south-1"
                    , ap-southeast-1 = "ap-southeast-1"
                    , ap-southeast-2 = "ap-southeast-2"
                    , ca-central-1 = "ca-central-1"
                    , cn-north-1 = "cn-north-1"
                    , cn-northwest-1 = "cn-northwest-1"
                    , eu-central-1 = "eu-central-1"
                    , eu-north-1 = "eu-north-1"
                    , eu-south-1 = "eu-south-1"
                    , eu-west-1 = "eu-west-1"
                    , eu-west-2 = "eu-west-2"
                    , eu-west-3 = "eu-west-3"
                    , me-south-1 = "me-south-1"
                    , sa-east-1 = "sa-east-1"
                    , us-gov-east-1 = "us-gov-east-1"
                    , us-gov-west-1 = "us-gov-west-1"
                    , us-east-1 = "us-east-1"
                    , us-east-2 = "us-east-2"
                    , us-west-1 = "us-west-1"
                    , us-west-2 = "us-west-2"
                    }
                    region

          in  render
      , human =
          let render
              : Region → Text
              = λ(region : Region) →
                  merge
                    { af-south-1 = "Africa (Cape Town)"
                    , ap-east-1 = "Asia Pacific (Hong Kong)"
                    , ap-northeast-1 = "Asia Pacific (Tokyo)"
                    , ap-northeast-2 = "Asia Pacific (Sydney)"
                    , ap-northeast-3 = "Asia Pacific (Osaka-Local)"
                    , ap-south-1 = "Asia Pacific (Mumbai)"
                    , ap-southeast-1 = "Asia Pacific (Singapore)"
                    , ap-southeast-2 = "Asia Pacific (Sydney)"
                    , ca-central-1 = "Canada (Central)"
                    , cn-north-1 = "China (Beijing)"
                    , cn-northwest-1 = "China (Ningxia)"
                    , eu-central-1 = "Europe (Frankfurt)"
                    , eu-north-1 = "Europe (Stockholm)"
                    , eu-south-1 = "Europe (Milan)"
                    , eu-west-1 = "Europe (Ireland)"
                    , eu-west-2 = "Europe (London)"
                    , eu-west-3 = "Europe (Paris)"
                    , me-south-1 = "Middle East (Bahrain)"
                    , sa-east-1 = "South America (São Paulo)"
                    , us-gov-east-1 = "GovCloud (US-East)"
                    , us-gov-west-1 = "GovCloud (US-West)"
                    , us-east-1 = "US East (N. Virginia)"
                    , us-east-2 = "US East (Ohio)"
                    , us-west-1 = "US West (N. California)"
                    , us-west-2 = "US West (Oregon)"
                    }
                    region

          in  render
      , availabilityZones =
          let Params =
                { Type =
                    { newCustomer : { ap-northeast-1 : Bool, us-west-1 : Bool }
                    }
                , default.newCustomer =
                  { ap-northeast-1 = True, us-west-1 = True }
                }

          let render
              : Params.Type → Region → List Text
              =
                {- newCustomer flag is there because on aws new customers can
                -- only access some of the availability zones.
                -}
                λ(_params : Params.Type) →
                λ(region : Region) →
                  merge
                    { af-south-1 =
                      [ "af-south-1a", "af-south-1b", "af-south-1c" ]
                    , ap-east-1 = [ "ap-east-1a", "ap-east-1b", "ap-east-1c" ]
                    , ap-northeast-1 =
                          [ "ap-northeast-1a"
                          , "ap-northeast-1b"
                          , "ap-northeast-1c"
                          ]
                        # ( if    _params.newCustomer.ap-northeast-1
                            then  [] : List Text
                            else  [ "ap-northeast-1d" ]
                          )
                    , ap-northeast-2 =
                      [ "ap-northeast-2a"
                      , "ap-northeast-2b"
                      , "ap-northeast-2c"
                      ]
                    , ap-northeast-3 =
                      [ "ap-northeast-3a"
                      , "ap-northeast-3b"
                      , "ap-northeast-3c"
                      ]
                    , ap-south-1 =
                      [ "ap-south-1a", "ap-south-1b", "ap-south-1c" ]
                    , ap-southeast-1 =
                      [ "ap-southeast-1a"
                      , "ap-southeast-1b"
                      , "ap-southeast-1c"
                      ]
                    , ap-southeast-2 =
                      [ "ap-southeast-2a"
                      , "ap-southeast-2b"
                      , "ap-southeast-2c"
                      ]
                    , ca-central-1 =
                      [ "ca-central-1a", "ca-central-1b", "ca-central-1c" ]
                    , cn-north-1 = [ "cn-north-1a", "cn-north-1b" ]
                    , cn-northwest-1 =
                      [ "cn-northwest-1a"
                      , "cn-northwest-1b"
                      , "cn-northwest-1c"
                      ]
                    , eu-central-1 =
                      [ "eu-central-1a", "eu-central-1b", "eu-central-1c" ]
                    , eu-north-1 =
                      [ "eu-north-1a", "eu-north-1b", "eu-north-1c" ]
                    , eu-south-1 =
                      [ "eu-south-1a", "eu-south-1b", "eu-south-1c" ]
                    , eu-west-1 = [ "eu-west-1a", "eu-west-1b", "eu-west-1c" ]
                    , eu-west-2 = [ "eu-west-2a", "eu-west-2b", "eu-west-2c" ]
                    , eu-west-3 = [ "eu-west-3a", "eu-west-3b", "eu-west-3c" ]
                    , me-south-1 =
                      [ "me-south-1a", "me-south-1b", "me-south-1c" ]
                    , sa-east-1 = [ "sa-east-1a", "sa-east-1b", "sa-east-1c" ]
                    , us-gov-east-1 =
                      [ "us-gov-east-1a", "us-gov-east-1b", "us-gov-east-1c" ]
                    , us-gov-west-1 =
                      [ "us-gov-west-1a", "us-gov-west-1b", "us-gov-west-1c" ]
                    , us-east-1 =
                      [ "us-east-1a"
                      , "us-east-1b"
                      , "us-east-1c"
                      , "us-east-1d"
                      , "us-east-1e"
                      , "us-east-1f"
                      ]
                    , us-east-2 = [ "us-east-2a", "us-east-2b", "us-east-2c" ]
                    , us-west-1 =
                          [ "us-west-1a", "us-west-1b" ]
                        # ( if    _params.newCustomer.us-west-1
                            then  [] : List Text
                            else  [ "us-west-1c" ]
                          )
                    , us-west-2 =
                      [ "us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d" ]
                    }
                    region

          in  { function = render, Params }
      , partition =
          let render
              : Region → Text
              = λ(region : Region) →
                  merge
                    { af-south-1 = "aws"
                    , ap-east-1 = "aws"
                    , ap-northeast-1 = "aws"
                    , ap-northeast-2 = "aws"
                    , ap-northeast-3 = "aws"
                    , ap-south-1 = "aws"
                    , ap-southeast-1 = "aws"
                    , ap-southeast-2 = "aws"
                    , ca-central-1 = "aws"
                    , cn-north-1 = "aws-cn"
                    , cn-northwest-1 = "aws-cn"
                    , eu-central-1 = "aws"
                    , eu-north-1 = "aws"
                    , eu-south-1 = "aws"
                    , eu-west-1 = "aws"
                    , eu-west-2 = "aws"
                    , eu-west-3 = "aws"
                    , me-south-1 = "aws"
                    , sa-east-1 = "aws"
                    , us-gov-east-1 = "aws-us-gov"
                    , us-gov-west-1 = "aws-us-gov"
                    , us-east-1 = "aws"
                    , us-east-2 = "aws"
                    , us-west-1 = "aws"
                    , us-west-2 = "aws"
                    }
                    region

          in  render
      }

in  { Type = Region
    , render
    , af-south-1 = Region.af-south-1
    , ap-east-1 = Region.ap-east-1
    , ap-northeast-1 = Region.ap-northeast-1
    , ap-northeast-2 = Region.ap-northeast-2
    , ap-northeast-3 = Region.ap-northeast-3
    , ap-south-1 = Region.ap-south-1
    , ap-southeast-1 = Region.ap-southeast-1
    , ap-southeast-2 = Region.ap-southeast-2
    , ca-central-1 = Region.ca-central-1
    , cn-north-1 = Region.cn-north-1
    , cn-northwest-1 = Region.cn-northwest-1
    , eu-central-1 = Region.eu-central-1
    , eu-north-1 = Region.eu-north-1
    , eu-south-1 = Region.eu-south-1
    , eu-west-1 = Region.eu-west-1
    , eu-west-2 = Region.eu-west-2
    , eu-west-3 = Region.eu-west-3
    , me-south-1 = Region.me-south-1
    , sa-east-1 = Region.sa-east-1
    , us-gov-east-1 = Region.us-gov-east-1
    , us-gov-west-1 = Region.us-gov-west-1
    , us-east-1 = Region.us-east-1
    , us-east-2 = Region.us-east-2
    , us-west-1 = Region.us-west-1
    , us-west-2 = Region.us-west-2
    }
