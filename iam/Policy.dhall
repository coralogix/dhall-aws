let Prelude = (../imports.dhall).Prelude

let JSON = Prelude.JSON

let Effect =
      let Effect = < Allow | Deny >
      
      in  { Type = Effect
          , Allow = Effect.Allow
          , Deny = Effect.Deny
          , render =
              let render =
                      λ(effect : Effect)
                    → merge
                        { Allow = JSON.string "Allow"
                        , Deny = JSON.string "Deny"
                        }
                        effect
              
              let testAllow =
                    assert : JSON.render (render Effect.Allow) ≡ "\"Allow\""
              
              let testDeny =
                    assert : JSON.render (render Effect.Deny) ≡ "\"Deny\""
              
              in  render
          }

let Actions =
      let Actions = List Text
      
      in  { Type = Actions
          , render =
              let render =
                      λ(actions : Actions)
                    → JSON.array
                        ( Prelude.List.map
                            Text
                            JSON.Type
                            (λ(action : Text) → JSON.string action)
                            actions
                        )
              
              let test =
                      assert
                    :   JSON.render (render [ "ec2:DescribeVpcs" ])
                      ≡ "[ \"ec2:DescribeVpcs\" ]"
              
              in  render
          }

let Resources =
      let Resources = List Text
      
      in  { Type = Resources
          , render =
              let render =
                      λ(resources : Resources)
                    → JSON.array
                        ( Prelude.List.map
                            Text
                            JSON.Type
                            (λ(resource : Text) → JSON.string resource)
                            resources
                        )
              
              let test = assert : JSON.render (render [ "*" ]) ≡ "[ \"*\" ]"
              
              in  render
          }

let Statement =
      let Statement =
            { effect : Effect.Type
            , actions : Actions.Type
            , resources : Resources.Type
            }
      
      in  { Type =
              Statement
          , default = {=}
          , render =
              let render =
                      λ(statement : Statement)
                    → JSON.object
                        ( toMap
                            { Effect = Effect.render statement.effect
                            , Action = Actions.render statement.actions
                            , Resource = Resources.render statement.resources
                            }
                        )
              
              let test =
                    let underTest
                        : Statement
                        = { effect = Effect.Allow
                          , actions = [ "route53:ChangeResourceRecordSets" ]
                          , resources = [ "arn:aws:route53:::hostedzone/*" ]
                          }
                    
                    let test =
                            assert
                          :   JSON.render
                                (render underTest)
                            ≡ "{ \"Action\": [ \"route53:ChangeResourceRecordSets\" ], \"Effect\": \"Allow\", \"Resource\": [ \"arn:aws:route53:::hostedzone/*\" ] }"
                    
                    in  underTest
              
              in  render
          }

in  { Effect = Effect
    , Actions = Actions
    , Resources = Resources
    , Statement = Statement
    }
