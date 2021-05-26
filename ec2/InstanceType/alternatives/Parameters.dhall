let Parameters =
      { Type =
          { permitLowerClassCPU : Bool
          , permitWorseNetwork : Bool
          , permitLowerEBSBandwidth : Bool
          , permitLosingLocalDisk : Bool
          , permitCrossInstanceFamily : Bool
          , permitUnsupportedByAwsVpcCni : Bool
          }
      , default = {=}
      }

in    Parameters
    ∧ { permitAll = Parameters::{
        , permitLowerClassCPU = True
        , permitWorseNetwork = True
        , permitLowerEBSBandwidth = True
        , permitLosingLocalDisk = True
        , permitCrossInstanceFamily = True
        , permitUnsupportedByAwsVpcCni = True
        }
      }
