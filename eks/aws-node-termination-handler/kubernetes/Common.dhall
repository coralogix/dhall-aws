let imports = ../../../imports.dhall

let Prelude = imports.Prelude

let Kubernetes = imports.Kubernetes

let Settings = ../Settings.dhall

let name = "aws-node-termination-handler"

let Common =
      { name : Text
      , labels :
          { selector : Prelude.Map.Type Text Text
          , package : Prelude.Map.Type Text Text
          }
      , metadata : Kubernetes.ObjectMeta.Type
      , settings : Settings.Type
      }

let definition
    : ∀(settings : Settings.Type) → Common
    =   λ(settings : Settings.Type)
      → let labels =
              let selector = toMap { `app.kubernetes.io/name` = name }
              
              in  { selector = selector
                  , package =
                        selector
                      # toMap
                          { k8s-app = name
                          , `app.kubernetes.io/version` = settings.pod.image.tag
                          , `app.kubernetes.io/managed-by` = "dhall"
                          }
                  }
        
        in  { name = name
            , labels = labels
            , metadata =
                Kubernetes.ObjectMeta::{
                , name = name
                , labels = Some labels.package
                , namespace = Some settings.pod.namespace
                }
            , settings = settings
            }

in  { Type = Common, definition = definition }
