let imports = ../imports.dhall

let Prelude = imports.Prelude

let InstanceType =
      < c5-large
      | c5-xlarge
      | c5-2xlarge
      | c5-4xlarge
      | m4-large
      | m4-xlarge
      | m4-2xlarge
      | m4-4xlarge
      | m5-large
      | m5-xlarge
      | m5-2xlarge
      | m5-4xlarge
      | m5a-large
      | m5a-xlarge
      | m5a-2xlarge
      | m5a-4xlarge
      | m5ad-large
      | m5ad-xlarge
      | m5ad-2xlarge
      | m5ad-4xlarge
      | m5n-large
      | m5n-xlarge
      | m5n-2xlarge
      | m5n-4xlarge
      | r5-large
      | r5-xlarge
      | r5-2xlarge
      | r5-4xlarge
      | r5a-large
      | r5a-xlarge
      | r5a-2xlarge
      | r5a-4xlarge
      | r5n-large
      | r5n-xlarge
      | r5n-2xlarge
      | r5n-4xlarge
      >

let test-util =
      { all =
          [ InstanceType.c5-large
          , InstanceType.c5-xlarge
          , InstanceType.c5-2xlarge
          , InstanceType.c5-4xlarge
          , InstanceType.m4-large
          , InstanceType.m4-xlarge
          , InstanceType.m4-2xlarge
          , InstanceType.m4-4xlarge
          , InstanceType.m5-large
          , InstanceType.m5-xlarge
          , InstanceType.m5-2xlarge
          , InstanceType.m5-4xlarge
          , InstanceType.m5a-large
          , InstanceType.m5a-xlarge
          , InstanceType.m5a-2xlarge
          , InstanceType.m5a-4xlarge
          , InstanceType.m5ad-large
          , InstanceType.m5ad-xlarge
          , InstanceType.m5ad-2xlarge
          , InstanceType.m5ad-4xlarge
          , InstanceType.m5n-large
          , InstanceType.m5n-xlarge
          , InstanceType.m5n-2xlarge
          , InstanceType.m5n-4xlarge
          , InstanceType.r5-large
          , InstanceType.r5-xlarge
          , InstanceType.r5-2xlarge
          , InstanceType.r5-4xlarge
          , InstanceType.r5a-large
          , InstanceType.r5a-xlarge
          , InstanceType.r5a-2xlarge
          , InstanceType.r5a-4xlarge
          , InstanceType.r5n-large
          , InstanceType.r5n-xlarge
          , InstanceType.r5n-2xlarge
          , InstanceType.r5n-4xlarge
          ]
      }

let render
    : InstanceType → Text
    =   λ(instanceType : InstanceType)
      → merge
          { c5-large = "c5.large"
          , c5-xlarge = "c5.xlarge"
          , c5-2xlarge = "c5.2xlarge"
          , c5-4xlarge = "c5.4xlarge"
          , m4-large = "m4.large"
          , m4-xlarge = "m4.xlarge"
          , m4-2xlarge = "m4.2xlarge"
          , m4-4xlarge = "m4.4xlarge"
          , m5-large = "m5.large"
          , m5-xlarge = "m5.xlarge"
          , m5-2xlarge = "m5.2xlarge"
          , m5-4xlarge = "m5.4xlarge"
          , m5a-large = "m5a.large"
          , m5a-xlarge = "m5a.xlarge"
          , m5a-2xlarge = "m5a.2xlarge"
          , m5a-4xlarge = "m5a.4xlarge"
          , m5ad-large = "m5ad.large"
          , m5ad-xlarge = "m5ad.xlarge"
          , m5ad-2xlarge = "m5ad.2xlarge"
          , m5ad-4xlarge = "m5ad.4xlarge"
          , m5n-large = "m5n.large"
          , m5n-xlarge = "m5n.xlarge"
          , m5n-2xlarge = "m5n.2xlarge"
          , m5n-4xlarge = "m5n.4xlarge"
          , r5-large = "r5.large"
          , r5-xlarge = "r5.xlarge"
          , r5-2xlarge = "r5.2xlarge"
          , r5-4xlarge = "r5.4xlarge"
          , r5a-large = "r5a.large"
          , r5a-xlarge = "r5a.xlarge"
          , r5a-2xlarge = "r5a.2xlarge"
          , r5a-4xlarge = "r5a.4xlarge"
          , r5n-large = "r5n.large"
          , r5n-xlarge = "r5n.xlarge"
          , r5n-2xlarge = "r5n.2xlarge"
          , r5n-4xlarge = "r5n.4xlarge"
          }
          instanceType

let specs =
      { vCPU =
          let vCPU
              : InstanceType → Natural
              =   λ(instanceType : InstanceType)
                → merge
                    { c5-large = 2
                    , c5-xlarge = 4
                    , c5-2xlarge = 8
                    , c5-4xlarge = 16
                    , m4-large = 2
                    , m4-xlarge = 4
                    , m4-2xlarge = 8
                    , m4-4xlarge = 16
                    , m5-large = 2
                    , m5-xlarge = 4
                    , m5-2xlarge = 8
                    , m5-4xlarge = 16
                    , m5a-large = 2
                    , m5a-xlarge = 4
                    , m5a-2xlarge = 8
                    , m5a-4xlarge = 16
                    , m5ad-large = 2
                    , m5ad-xlarge = 4
                    , m5ad-2xlarge = 8
                    , m5ad-4xlarge = 16
                    , m5n-large = 2
                    , m5n-xlarge = 4
                    , m5n-2xlarge = 8
                    , m5n-4xlarge = 16
                    , r5-large = 2
                    , r5-xlarge = 4
                    , r5-2xlarge = 8
                    , r5-4xlarge = 16
                    , r5a-large = 2
                    , r5a-xlarge = 4
                    , r5a-2xlarge = 8
                    , r5a-4xlarge = 16
                    , r5n-large = 2
                    , r5n-xlarge = 4
                    , r5n-2xlarge = 8
                    , r5n-4xlarge = 16
                    }
                    instanceType
          
          in  vCPU
      , memory =
          let memory
              : InstanceType → Natural
              =   λ(instanceType : InstanceType)
                → merge
                    { c5-large = 4
                    , c5-xlarge = 8
                    , c5-2xlarge = 16
                    , c5-4xlarge = 32
                    , m4-large = 8
                    , m4-xlarge = 16
                    , m4-2xlarge = 32
                    , m4-4xlarge = 64
                    , m5-large = 8
                    , m5-xlarge = 16
                    , m5-2xlarge = 32
                    , m5-4xlarge = 64
                    , m5a-large = 8
                    , m5a-xlarge = 16
                    , m5a-2xlarge = 32
                    , m5a-4xlarge = 64
                    , m5ad-large = 8
                    , m5ad-xlarge = 16
                    , m5ad-2xlarge = 32
                    , m5ad-4xlarge = 64
                    , m5n-large = 8
                    , m5n-xlarge = 16
                    , m5n-2xlarge = 32
                    , m5n-4xlarge = 64
                    , r5-large = 16
                    , r5-xlarge = 32
                    , r5-2xlarge = 64
                    , r5-4xlarge = 128
                    , r5a-large = 16
                    , r5a-xlarge = 32
                    , r5a-2xlarge = 64
                    , r5a-4xlarge = 128
                    , r5n-large = 16
                    , r5n-xlarge = 32
                    , r5n-2xlarge = 64
                    , r5n-4xlarge = 128
                    }
                    instanceType
          
          in  memory
      }

let alternatives =
      let Parameters =
            { Type =
                { permitLowerClassCPU : Bool
                , permitWorseNetwork : Bool
                , permitLosingLocalDisk : Bool
                }
            , default = {=}
            }
      
      let alternatives
          : Parameters.Type → InstanceType → List InstanceType
          =   λ(_params : Parameters.Type)
            → λ(instanceType : InstanceType)
            → merge
                { c5-large = [] : List InstanceType
                , c5-xlarge = [] : List InstanceType
                , c5-2xlarge = [] : List InstanceType
                , c5-4xlarge = [] : List InstanceType
                , m4-large =
                    [ InstanceType.m5-large
                    , InstanceType.m5a-large
                    , InstanceType.m5ad-large
                    , InstanceType.m5n-large
                    ]
                , m4-xlarge =
                    [ InstanceType.m5-xlarge
                    , InstanceType.m5a-xlarge
                    , InstanceType.m5ad-xlarge
                    , InstanceType.m5n-xlarge
                    ]
                , m4-2xlarge =
                    [ InstanceType.m5-2xlarge
                    , InstanceType.m5a-2xlarge
                    , InstanceType.m5ad-2xlarge
                    , InstanceType.m5n-2xlarge
                    ]
                , m4-4xlarge =
                    [ InstanceType.m5-4xlarge
                    , InstanceType.m5a-4xlarge
                    , InstanceType.m5ad-4xlarge
                    , InstanceType.m5n-4xlarge
                    ]
                , m5-large =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-large ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5a-large
                      , InstanceType.m5ad-large
                      , InstanceType.m5n-large
                      ]
                , m5-xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5a-xlarge
                      , InstanceType.m5ad-xlarge
                      , InstanceType.m5n-xlarge
                      ]
                , m5-2xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-2xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5a-2xlarge
                      , InstanceType.m5ad-2xlarge
                      , InstanceType.m5n-2xlarge
                      ]
                , m5-4xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-4xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5a-4xlarge
                      , InstanceType.m5ad-4xlarge
                      , InstanceType.m5n-4xlarge
                      ]
                , m5a-large =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-large ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5-large
                      , InstanceType.m5ad-large
                      , InstanceType.m5n-large
                      ]
                , m5a-xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5-xlarge
                      , InstanceType.m5ad-xlarge
                      , InstanceType.m5n-xlarge
                      ]
                , m5a-2xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-2xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5-2xlarge
                      , InstanceType.m5ad-2xlarge
                      , InstanceType.m5n-2xlarge
                      ]
                , m5a-4xlarge =
                      (       if _params.permitLowerClassCPU
                        
                        then  [ InstanceType.m4-4xlarge ]
                        
                        else  [] : List InstanceType
                      )
                    # [ InstanceType.m5-4xlarge
                      , InstanceType.m5ad-4xlarge
                      , InstanceType.m5n-4xlarge
                      ]
                , m5ad-large =
                          if _params.permitLosingLocalDisk
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-large ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-large
                            , InstanceType.m5a-large
                            , InstanceType.m5n-large
                            ]
                    
                    else  [] : List InstanceType
                , m5ad-xlarge =
                          if _params.permitLosingLocalDisk
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-xlarge
                            , InstanceType.m5a-xlarge
                            , InstanceType.m5n-xlarge
                            ]
                    
                    else  [] : List InstanceType
                , m5ad-2xlarge =
                          if _params.permitLosingLocalDisk
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-2xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-2xlarge
                            , InstanceType.m5a-2xlarge
                            , InstanceType.m5n-2xlarge
                            ]
                    
                    else  [] : List InstanceType
                , m5ad-4xlarge =
                          if _params.permitLosingLocalDisk
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-4xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-4xlarge
                            , InstanceType.m5a-4xlarge
                            , InstanceType.m5n-4xlarge
                            ]
                    
                    else  [] : List InstanceType
                , m5n-large =
                          if _params.permitWorseNetwork
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-large ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m4-large
                            , InstanceType.m5-large
                            , InstanceType.m5a-large
                            , InstanceType.m5ad-large
                            ]
                    
                    else  [] : List InstanceType
                , m5n-xlarge =
                          if _params.permitWorseNetwork
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-xlarge
                            , InstanceType.m5a-xlarge
                            , InstanceType.m5ad-xlarge
                            ]
                    
                    else  [] : List InstanceType
                , m5n-2xlarge =
                          if _params.permitWorseNetwork
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-2xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-2xlarge
                            , InstanceType.m5a-2xlarge
                            , InstanceType.m5ad-2xlarge
                            ]
                    
                    else  [] : List InstanceType
                , m5n-4xlarge =
                          if _params.permitWorseNetwork
                    
                    then    (       if _params.permitLowerClassCPU
                              
                              then  [ InstanceType.m4-4xlarge ]
                              
                              else  [] : List InstanceType
                            )
                          # [ InstanceType.m5-4xlarge
                            , InstanceType.m5a-4xlarge
                            , InstanceType.m5ad-4xlarge
                            ]
                    
                    else  [] : List InstanceType
                , r5-large = [ InstanceType.r5a-large, InstanceType.r5n-large ]
                , r5-xlarge =
                    [ InstanceType.r5a-xlarge, InstanceType.r5n-xlarge ]
                , r5-2xlarge =
                    [ InstanceType.r5a-2xlarge, InstanceType.r5n-2xlarge ]
                , r5-4xlarge =
                    [ InstanceType.r5a-4xlarge, InstanceType.r5n-4xlarge ]
                , r5a-large = [ InstanceType.r5-large, InstanceType.r5n-large ]
                , r5a-xlarge =
                    [ InstanceType.r5-xlarge, InstanceType.r5n-xlarge ]
                , r5a-2xlarge =
                    [ InstanceType.r5-2xlarge, InstanceType.r5n-2xlarge ]
                , r5a-4xlarge =
                    [ InstanceType.r5-4xlarge, InstanceType.r5n-4xlarge ]
                , r5n-large =
                          if _params.permitWorseNetwork
                    
                    then  [ InstanceType.r5-large, InstanceType.r5a-large ]
                    
                    else  [] : List InstanceType
                , r5n-xlarge =
                          if _params.permitWorseNetwork
                    
                    then  [ InstanceType.r5-xlarge, InstanceType.r5a-xlarge ]
                    
                    else  [] : List InstanceType
                , r5n-2xlarge =
                          if _params.permitWorseNetwork
                    
                    then  [ InstanceType.r5-2xlarge, InstanceType.r5a-2xlarge ]
                    
                    else  [] : List InstanceType
                , r5n-4xlarge =
                          if _params.permitWorseNetwork
                    
                    then  [ InstanceType.r5-4xlarge, InstanceType.r5a-4xlarge ]
                    
                    else  [] : List InstanceType
                }
                instanceType
      
      let tests =
            { samespecs =
                let common =
                        λ(spec : InstanceType → Natural)
                      → Prelude.List.all
                          InstanceType
                          (   λ(instanceType : InstanceType)
                            → let alternatives =
                                    alternatives
                                      Parameters::{
                                      , permitLowerClassCPU = True
                                      , permitWorseNetwork = True
                                      , permitLosingLocalDisk = True
                                      }
                                      instanceType
                              
                              in  Prelude.List.all
                                    InstanceType
                                    (   λ ( alternativeInstanceType
                                          : InstanceType
                                          )
                                      → Prelude.Natural.equal
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
      
      in  { Parameters = Parameters, function = alternatives }

let upsize
    : InstanceType → Optional InstanceType
    =   λ(instanceType : InstanceType)
      → merge
          { c5-large = Some InstanceType.c5-xlarge
          , c5-xlarge = Some InstanceType.c5-2xlarge
          , c5-2xlarge = Some InstanceType.c5-4xlarge
          , c5-4xlarge = None InstanceType
          , m4-large = Some InstanceType.m4-xlarge
          , m4-xlarge = Some InstanceType.m4-2xlarge
          , m4-2xlarge = Some InstanceType.m4-4xlarge
          , m4-4xlarge = None InstanceType
          , m5-large = Some InstanceType.m5-xlarge
          , m5-xlarge = Some InstanceType.m5-2xlarge
          , m5-2xlarge = Some InstanceType.m5-4xlarge
          , m5-4xlarge = None InstanceType
          , m5a-large = Some InstanceType.m5a-xlarge
          , m5a-xlarge = Some InstanceType.m5a-2xlarge
          , m5a-2xlarge = Some InstanceType.m5a-4xlarge
          , m5a-4xlarge = None InstanceType
          , m5ad-large = Some InstanceType.m5ad-xlarge
          , m5ad-xlarge = Some InstanceType.m5ad-2xlarge
          , m5ad-2xlarge = Some InstanceType.m5ad-4xlarge
          , m5ad-4xlarge = None InstanceType
          , m5n-large = Some InstanceType.m5n-xlarge
          , m5n-xlarge = Some InstanceType.m5n-2xlarge
          , m5n-2xlarge = Some InstanceType.m5n-4xlarge
          , m5n-4xlarge = None InstanceType
          , r5-large = Some InstanceType.r5-xlarge
          , r5-xlarge = Some InstanceType.r5-2xlarge
          , r5-2xlarge = Some InstanceType.r5-4xlarge
          , r5-4xlarge = None InstanceType
          , r5a-large = Some InstanceType.r5a-xlarge
          , r5a-xlarge = Some InstanceType.r5a-2xlarge
          , r5a-2xlarge = Some InstanceType.r5a-4xlarge
          , r5a-4xlarge = None InstanceType
          , r5n-large = Some InstanceType.r5n-xlarge
          , r5n-xlarge = Some InstanceType.r5n-2xlarge
          , r5n-2xlarge = Some InstanceType.r5n-4xlarge
          , r5n-4xlarge = None InstanceType
          }
          instanceType

in  { Type = InstanceType
    , render = render
    , upsize = upsize
    , specs = specs
    , alternatives = alternatives
    , c5-xlarge = InstanceType.c5-xlarge
    , c5-2xlarge = InstanceType.c5-2xlarge
    , c5-4xlarge = InstanceType.c5-4xlarge
    , m4-large = InstanceType.m4-large
    , m4-xlarge = InstanceType.m4-xlarge
    , m4-2xlarge = InstanceType.m4-2xlarge
    , m4-4xlarge = InstanceType.m4-4xlarge
    , m5-large = InstanceType.m5-large
    , m5-xlarge = InstanceType.m5-xlarge
    , m5-2xlarge = InstanceType.m5-2xlarge
    , m5-4xlarge = InstanceType.m5-4xlarge
    , m5a-large = InstanceType.m5a-large
    , m5a-xlarge = InstanceType.m5a-xlarge
    , m5a-2xlarge = InstanceType.m5a-2xlarge
    , m5a-4xlarge = InstanceType.m5a-4xlarge
    , m5ad-large = InstanceType.m5ad-large
    , m5ad-xlarge = InstanceType.m5ad-xlarge
    , m5ad-2xlarge = InstanceType.m5ad-2xlarge
    , m5ad-4xlarge = InstanceType.m5ad-4xlarge
    , m5n-large = InstanceType.m5n-large
    , m5n-xlarge = InstanceType.m5n-xlarge
    , m5n-2xlarge = InstanceType.m5n-2xlarge
    , m5n-4xlarge = InstanceType.m5n-4xlarge
    , r5-large = InstanceType.r5-large
    , r5-xlarge = InstanceType.r5-xlarge
    , r5-2xlarge = InstanceType.r5-2xlarge
    , r5-4xlarge = InstanceType.r5-4xlarge
    , r5a-large = InstanceType.r5a-large
    , r5a-xlarge = InstanceType.r5a-xlarge
    , r5a-2xlarge = InstanceType.r5a-2xlarge
    , r5a-4xlarge = InstanceType.r5a-4xlarge
    , r5n-large = InstanceType.r5n-large
    , r5n-xlarge = InstanceType.r5n-xlarge
    , r5n-2xlarge = InstanceType.r5n-2xlarge
    , r5n-4xlarge = InstanceType.r5n-4xlarge
    }
