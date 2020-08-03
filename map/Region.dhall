let Prelude = (../imports.dhall).Prelude

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

let name =
      λ(region : Region) →
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

let render =
      { computer =
          let render
              : Region → Text
              = name

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
                    { new-customer : { ap-northeast-1 : Bool, us-west-1 : Bool }
                    }
                , default.new-customer =
                  { ap-northeast-1 = True, us-west-1 = True }
                }

          let letters
              : Params.Type → Region → List Text
              =
                {- new-customer flag is there because on aws new customers on
                -- `ap-northeast-1 & us-west-1` can only access some of the availability zones.
                -- https://aws.amazon.com/about-aws/global-infrastructure/regions_az/
                -}
                λ(_params : Params.Type) →
                λ(region : Region) →
                  merge
                    { af-south-1 = [ "a", "b", "c" ]
                    , ap-east-1 = [ "a", "b", "c" ]
                    , ap-northeast-1 =
                          [ "a", "b", "c" ]
                        # ( if    _params.new-customer.ap-northeast-1
                            then  [] : List Text
                            else  [ "d" ]
                          )
                    , ap-northeast-2 = [ "a", "b", "c" ]
                    , ap-northeast-3 = [ "a", "b", "c" ]
                    , ap-south-1 = [ "a", "b", "c" ]
                    , ap-southeast-1 = [ "a", "b", "c" ]
                    , ap-southeast-2 = [ "a", "b", "c" ]
                    , ca-central-1 = [ "a", "b", "c" ]
                    , cn-north-1 = [ "a", "b" ]
                    , cn-northwest-1 = [ "a", "b", "c" ]
                    , eu-central-1 = [ "a", "b", "c" ]
                    , eu-north-1 = [ "a", "b", "c" ]
                    , eu-south-1 = [ "a", "b", "c" ]
                    , eu-west-1 = [ "a", "b", "c" ]
                    , eu-west-2 = [ "a", "b", "c" ]
                    , eu-west-3 = [ "a", "b", "c" ]
                    , me-south-1 = [ "a", "b", "c" ]
                    , sa-east-1 = [ "a", "b", "c" ]
                    , us-gov-east-1 = [ "a", "b", "c" ]
                    , us-gov-west-1 = [ "a", "b", "c" ]
                    , us-east-1 = [ "a", "b", "c", "d", "e", "f" ]
                    , us-east-2 = [ "a", "b", "c" ]
                    , us-west-1 =
                          [ "a", "b" ]
                        # ( if    _params.new-customer.us-west-1
                            then  [] : List Text
                            else  [ "c" ]
                          )
                    , us-west-2 = [ "a", "b", "c" ]
                    }
                    region

          let render
              : Params.Type → Region → List Text
              =
                {- new-customer flag is there because on aws new customers can
                -- only access some of the availability zones.
                -}
                λ(_params : Params.Type) →
                λ(region : Region) →
                  let generate
                      : Region → List Text
                      = λ(region : Region) →
                          Prelude.List.map
                            Text
                            Text
                            (λ(letter : Text) → name region ++ letter)
                            (letters _params region)

                  let test =
                          assert
                        :   generate Region.eu-west-1
                          ≡ [ "eu-west-1a", "eu-west-1b", "eu-west-1c" ]

                  in  merge
                        { af-south-1 = generate Region.af-south-1
                        , ap-east-1 = generate Region.ap-east-1
                        , ap-northeast-1 = generate Region.ap-northeast-1
                        , ap-northeast-2 = generate Region.ap-northeast-2
                        , ap-northeast-3 = generate Region.ap-northeast-3
                        , ap-south-1 = generate Region.ap-south-1
                        , ap-southeast-1 = generate Region.ap-southeast-1
                        , ap-southeast-2 = generate Region.ap-southeast-2
                        , ca-central-1 = generate Region.ca-central-1
                        , cn-north-1 = generate Region.cn-north-1
                        , cn-northwest-1 = generate Region.cn-northwest-1
                        , eu-central-1 = generate Region.eu-central-1
                        , eu-north-1 = generate Region.eu-north-1
                        , eu-south-1 = generate Region.eu-south-1
                        , eu-west-1 = generate Region.eu-west-1
                        , eu-west-2 = generate Region.eu-west-2
                        , eu-west-3 = generate Region.eu-west-3
                        , me-south-1 = generate Region.me-south-1
                        , sa-east-1 = generate Region.sa-east-1
                        , us-gov-east-1 = generate Region.us-gov-east-1
                        , us-gov-west-1 = generate Region.us-gov-west-1
                        , us-east-1 = generate Region.us-east-1
                        , us-east-2 = generate Region.us-east-2
                        , us-west-1 = generate Region.us-west-1
                        , us-west-2 = generate Region.us-west-2
                        }
                        region

          in  { function = render, Params, letters }
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
