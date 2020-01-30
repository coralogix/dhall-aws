let Region = < eu-west-1 >

let render =
      { computer =
          let render
              : Region → Text
              = λ(region : Region) → merge { eu-west-1 = "eu-west-1" } region
          
          in  render
      , human =
          let render
              : Region → Text
              =   λ(region : Region)
                → merge { eu-west-1 = "Europe (Ireland)" } region
          
          in  render
      }

in  { Type = Region, eu-west-1 = Region.eu-west-1, render = render }
