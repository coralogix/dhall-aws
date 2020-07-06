let Prelude = (../imports.dhall).Prelude

let JSON = Prelude.JSON

let util = ./util.dhall

let render-list = util.render.list

let Version =
      let Version = < `2012-10-17` | `2008-10-17` >

      in  { Type = Version
          , `2012-10-17` = Version.`2012-10-17`
          , `2008-10-17` = Version.`2008-10-17`
          , render =
              let render =
                    λ(version : Version) →
                      merge
                        { `2012-10-17` = JSON.string "2012-10-17"
                        , `2008-10-17` = JSON.string "2008-10-17"
                        }
                        version

              let test =
                    { `2012` =
                          assert
                        :   JSON.render (render Version.`2012-10-17`)
                          ≡ ''
                            "2012-10-17"
                            ''
                    , `2008` =
                          assert
                        :   JSON.render (render Version.`2008-10-17`)
                          ≡ ''
                            "2008-10-17"
                            ''
                    }

              in  render
          }

let Principal =
      let Principal =
            { Type =
                { aws : List Text
                , federated : List Text
                , service : List Text
                , canonical-user : List Text
                }
            , default =
              { aws = [] : List Text
              , federated = [] : List Text
              , service = [] : List Text
              , canonical-user = [] : List Text
              }
            }

      in    Principal
          ∧ { render =
                let render =
                      let is-empty
                          : ∀(principal : Principal.Type) → Bool
                          = λ(principal : Principal.Type) →
                                  Prelude.List.null Text principal.aws
                              &&  Prelude.List.null Text principal.federated
                              &&  Prelude.List.null Text principal.service
                              &&  Prelude.List.null
                                    Text
                                    principal.canonical-user

                      let render-list = render-list Text JSON.string

                      in  λ(principal : Principal.Type) →
                            if    is-empty principal
                            then  None JSON.Type
                            else  Some
                                    ( JSON.object
                                        (   render-list "AWS" principal.aws
                                          # render-list
                                              "Federated"
                                              principal.federated
                                          # render-list
                                              "Service"
                                              principal.service
                                          # render-list
                                              "CanonicalUser"
                                              principal.canonical-user
                                        )
                                    )

                in  render
            }

let Effect =
      let Effect = < Allow | Deny >

      in  { Type = Effect
          , Allow = Effect.Allow
          , Deny = Effect.Deny
          , render =
              let render =
                    λ(effect : Effect) →
                      merge
                        { Allow = JSON.string "Allow"
                        , Deny = JSON.string "Deny"
                        }
                        effect

              let test =
                    { allow =
                          assert
                        :   JSON.render (render Effect.Allow)
                          ≡ ''
                            "Allow"
                            ''
                    , deny =
                          assert
                        :   JSON.render (render Effect.Deny)
                          ≡ ''
                            "Deny"
                            ''
                    }

              in  render
          }

let render-opt =
      { json =
          λ(key : Text) →
          λ(json : Optional (Prelude.Map.Type Text JSON.Type)) →
            merge
              { Some =
                  λ(json : Prelude.Map.Type Text JSON.Type) →
                    [ Prelude.Map.keyValue JSON.Type key (JSON.object json) ]
              , None = Prelude.Map.empty Text JSON.Type
              }
              json
      , principal =
          λ(key : Text) →
          λ(principal : Optional Principal.Type) →
            merge
              { Some =
                  λ(principal : Principal.Type) →
                    merge
                      { Some =
                          λ(value : JSON.Type) →
                            [ Prelude.Map.keyValue JSON.Type key value ]
                      , None = Prelude.Map.empty Text JSON.Type
                      }
                      (Principal.render principal)
              , None = Prelude.Map.empty Text JSON.Type
              }
              principal
      , text =
          λ(key : Text) →
          λ(value : Optional Text) →
            merge
              { Some =
                  λ(it : Text) →
                    [ Prelude.Map.keyValue JSON.Type key (JSON.string it) ]
              , None = Prelude.Map.empty Text JSON.Type
              }
              value
      }

let Statement =
      let Statement =
            { Type =
                { sid : Optional Text
                , effect : Effect.Type
                , principal : Optional Principal.Type
                , actions : List Text
                , resources : List Text
                , condition : Optional (Prelude.Map.Type Text JSON.Type)
                }
            , default =
              { sid = None Text
              , principal = None Principal.Type
              , condition = None (Prelude.Map.Type Text JSON.Type)
              }
            }

      in    Statement
          ∧ { render =
                let render =
                      λ(statement : Statement.Type) →
                        JSON.object
                          (   render-opt.text "Sid" statement.sid
                            # toMap { Effect = Effect.render statement.effect }
                            # render-list
                                Text
                                JSON.string
                                "Action"
                                statement.actions
                            # render-list
                                Text
                                JSON.string
                                "Resource"
                                statement.resources
                            # render-opt.principal
                                "Principal"
                                statement.principal
                            # render-opt.json "Condition" statement.condition
                          )

                let test =
                      { minimal =
                          let under-test =
                                Statement::{
                                , effect = Effect.Allow
                                , actions =
                                  [ "route53:ChangeResourceRecordSets" ]
                                , resources =
                                  [ "arn:aws:route53:::hostedzone/*" ]
                                }

                          in    assert
                              :   JSON.render (render under-test)
                                ≡ ''
                                  {
                                    "Effect": "Allow",
                                    "Action": "route53:ChangeResourceRecordSets",
                                    "Resource": "arn:aws:route53:::hostedzone/*"
                                  }
                                  ''
                      , with-principal =
                          let under-test =
                                Statement::{
                                , effect = Effect.Allow
                                , principal = Some Principal::{
                                  , aws = [ "arn:aws:iam::111122223333:root" ]
                                  }
                                , actions =
                                  [ "route53:ChangeResourceRecordSets" ]
                                , resources =
                                  [ "arn:aws:route53:::hostedzone/*" ]
                                }

                          in    assert
                              :   JSON.render (render under-test)
                                ≡ ''
                                  {
                                    "Effect": "Allow",
                                    "Action": "route53:ChangeResourceRecordSets",
                                    "Resource": "arn:aws:route53:::hostedzone/*",
                                    "Principal": { "AWS": "arn:aws:iam::111122223333:root" }
                                  }
                                  ''
                      }

                in  render
            }

let Policy =
      let Policy =
            { Type =
                { version : Version.Type
                , id : Optional Text
                , statements : List Statement.Type
                }
            , default = { version = Version.`2012-10-17`, id = None Text }
            }

      in    Policy
          ∧ { render =
                λ(policy : Policy.Type) →
                  JSON.object
                    (   [ Prelude.Map.keyValue
                            JSON.Type
                            "Version"
                            (Version.render policy.version)
                        ]
                      # render-opt.text "Id" policy.id
                      # render-list
                          Statement.Type
                          Statement.render
                          "Statement"
                          policy.statements
                    )
            }

in  { Effect, Policy, Principal, Statement, Version }
