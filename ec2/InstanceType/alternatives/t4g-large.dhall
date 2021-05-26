let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then    [ InstanceType.c6g-xlarge
              , InstanceType.c6gd-xlarge
              , InstanceType.m6g-large
              , InstanceType.m6gd-large
              , InstanceType.r6g-large
              , InstanceType.r6gd-large
              ]
            # ( if    _params.permitUnsupportedByAwsVpcCni
                then  [ InstanceType.c6gn-xlarge ]
                else  [] : List InstanceType
              )
      else  [] : List InstanceType
