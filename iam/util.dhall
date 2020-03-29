let imports = ../imports.dhall

let Prelude = imports.Prelude

let JSON = Prelude.JSON

in  { render.list =
        let render-list
            :   ∀(type : Type)
              → ∀(render : type → JSON.Type)
              → ∀(key : Text)
              → ∀(values : List type)
              → Prelude.Map.Type Text JSON.Type
            =
              {- The grammar of AWS IAM policy documents differentiates between three cases:
              -- 1. When there is no value for a given key, the key should not be specified.
              --    This is produced below by the empty map `Prelude.Map.empty Text JSON.Type`.
              -- 2. When there is only a single value for a given key, the key should be
              --    specified, and the value should be produced directly as a string, e.g.
              --    "AWS": "*"
              -- 3. When there are multiple values for a given key, the key should be
              --    specified, and the values should be produced inside of an array, e.g.
              --    "Service": [ "elasticmapreduce.amazonaws.com", "datapipeline.amazonaws.com" ]
              --
              -- `render-list` is the function which provides the necessary abstraction to
              --  correctly render a key and its values regardless of whether the number of values
              -- is zero, one, or greater than one.
              -}
              let render =
                      λ(type : Type)
                    → λ(render : type → JSON.Type)
                    → λ(key : Text)
                    → λ(values : List type)
                    → let head = Prelude.List.head type values

                      let tail = Prelude.List.drop 1 type values

                      let tail-head = Prelude.List.head type tail

                      in  merge
                            { Some =
                                  λ(first : type)
                                → [ Prelude.Map.keyValue
                                      JSON.Type
                                      key
                                      ( merge
                                          { Some =
                                                λ(_ : type)
                                              → JSON.array
                                                  ( Prelude.List.map
                                                      type
                                                      JSON.Type
                                                      render
                                                      values
                                                  )
                                          , None = render first
                                          }
                                          tail-head
                                      )
                                  ]
                            , None = Prelude.Map.empty Text JSON.Type
                            }
                            head

              let test =
                    let text-render = render Text JSON.string

                    in  { empty =
                              assert
                            :   text-render "Foo" ([] : List Text)
                              ≡ Prelude.Map.empty Text JSON.Type
                        , single-type =
                          { single-entry =
                                assert
                              :   text-render "AWS" [ "*" ]
                                ≡ toMap { AWS = JSON.string "*" }
                          , multiple-entry =
                                assert
                              :   text-render
                                    "Service"
                                    [ "elasticmapreduce.amazonaws.com"
                                    , "datapipeline.amazonaws.com"
                                    ]
                                ≡ toMap
                                    { Service =
                                        JSON.array
                                          [ JSON.string
                                              "elasticmapreduce.amazonaws.com"
                                          , JSON.string
                                              "datapipeline.amazonaws.com"
                                          ]
                                    }
                          }
                        }

              in  render

        in  render-list
    }
