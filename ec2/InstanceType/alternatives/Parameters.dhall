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

in  Parameters
