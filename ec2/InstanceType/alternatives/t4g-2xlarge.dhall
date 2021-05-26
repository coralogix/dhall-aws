let InstanceType = ../Type.dhall

let Parameters = ./Parameters.dhall

in  λ(_params : Parameters.Type) →
      if    _params.permitCrossInstanceFamily
      then    [ InstanceType.c6g-4xlarge
              , InstanceType.c6gd-4xlarge
              , InstanceType.m6g-2xlarge
              , InstanceType.m6gd-2xlarge
              , InstanceType.r6g-2xlarge
              , InstanceType.r6gd-2xlarge
              ]
            # ( if    _params.permitUnsupportedByAwsVpcCni
                then  [ InstanceType.c6gn-4xlarge ]
                else  [] : List InstanceType
              )
      else  [] : List InstanceType
