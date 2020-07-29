let Region =
      < af-south-1
      | ap-east-1
      | ap-northeast-1
      | ap-northeast-2
      | ap-south-1
      | ap-southeast-1
      | ap-southeast-2
      | ca-central-1
      | eu-central-1
      | eu-north-1
      | eu-south-1
      | eu-west-1
      | eu-west-2
      | eu-west-3
      | me-south-1
      | sa-east-1
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
                    , ap-south-1 = "ap-south-1"
                    , ap-southeast-1 = "ap-southeast-1"
                    , ap-southeast-2 = "ap-southeast-2"
                    , ca-central-1 = "ca-central-1"
                    , eu-central-1 = "eu-central-1"
                    , eu-north-1 = "eu-north-1"
                    , eu-south-1 = "eu-south-1"
                    , eu-west-1 = "eu-west-1"
                    , eu-west-2 = "eu-west-2"
                    , eu-west-3 = "eu-west-3"
                    , me-south-1 = "me-south-1"
                    , sa-east-1 = "sa-east-1"
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
                    , ap-south-1 = "Asia Pacific (Mumbai)"
                    , ap-southeast-1 = "Asia Pacific (Singapore)"
                    , ap-southeast-2 = "Asia Pacific (Sydney)"
                    , ca-central-1 = "Canada (Central)"
                    , eu-central-1 = "Europe (Frankfurt)"
                    , eu-north-1 = "Europe (Stockholm)"
                    , eu-south-1 = "Europe (Milan)"
                    , eu-west-1 = "Europe (Ireland)"
                    , eu-west-2 = "Europe (London)"
                    , eu-west-3 = "Europe (Paris)"
                    , me-south-1 = "Middle East (Bahrain)"
                    , sa-east-1 = "South America (São Paulo)"
                    , us-east-1 = "US East (N. Virginia)"
                    , us-east-2 = "US East (Ohio)"
                    , us-west-1 = "US West (N. California)"
                    , us-west-2 = "US West (Oregon)"
                    }
                    region

          in  render
      , availabilityZones =
          let render
              : Region → List Text
              = λ(region : Region) →
                  merge
                    { af-south-1 =
                      [ "af-south-1a", "af-south-1b", "af-south-1c" ]
                    , ap-east-1 = [ "ap-east-1a", "ap-east-1b", "ap-east-1c" ]
                    , ap-northeast-1 =
                      [ "ap-northeast-1a"
                      , "ap-northeast-1b"
                      , "ap-northeast-1c"
                      ]
                    , ap-northeast-2 =
                      [ "ap-northeast-2a"
                      , "ap-northeast-2b"
                      , "ap-northeast-2c"
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
                    , us-east-1 =
                      [ "us-east-1a"
                      , "us-east-1b"
                      , "us-east-1c"
                      , "us-east-1d"
                      , "us-east-1e"
                      , "us-east-1f"
                      ]
                    , us-east-2 = [ "us-east-2a", "us-east-2b", "us-east-2c" ]
                    , us-west-1 = [ "us-west-1a", "us-west-1b", "us-west-1c" ]
                    , us-west-2 =
                      [ "us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d" ]
                    }
                    region

          in  render
      }

in  { Type = Region, eu-west-1 = Region.eu-west-1, render }
