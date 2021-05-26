let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
        ( if    _params.permitCrossInstanceFamily
          then    [ InstanceType.c6g-large
                  , InstanceType.c6gd-large
                  , InstanceType.m6g-large
                  , InstanceType.m6gd-large
                  , InstanceType.r6g-large
                  , InstanceType.r6gd-large
                  ]
                # ( if    _params.permitUnsupportedByAwsVpcCni
                    then  [ InstanceType.c6gn-large ]
                    else  [] : List InstanceType
                  )
          else  [] : List InstanceType
        )
      # [ InstanceType.t4g-micro, InstanceType.t4g-small ]
