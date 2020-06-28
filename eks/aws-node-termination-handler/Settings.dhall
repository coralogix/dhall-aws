let imports = ../../imports.dhall

let Prelude = imports.Prelude

let Kubernetes = imports.Kubernetes

let Pod =
      let Image =
            { Type = { repository : Text, tag : Text, pullPolicy : Text }
            , default =
                { repository = "amazon/aws-node-termination-handler"
                , tag = "v1.5.0"
                , pullPolicy = "IfNotPresent"
                }
            }

      let Resources =
            { Type =
                { requests : { cpu : Text, memory : Text }
                , limits : { cpu : Text, memory : Text }
                }
            , default =
                { requests = { cpu = "50m", memory = "64Mi" }
                , limits = { cpu = "100m", memory = "128Mi" }
                }
            }

      in  { Type =
              { image : Image.Type
              , namespace : Text
              , nodeSelector : Optional (Prelude.Map.Type Text Text)
              , procUptimeFile : Text
              , resources : Resources.Type
              , tolerations : Optional (List Kubernetes.Toleration.Type)
              }
          , default =
              { image = Image.default
              , namespace = "kube-system"
              , nodeSelector = None (Prelude.Map.Type Text Text)
              , procUptimeFile = "/proc/uptime"
              , resources = Resources.default
              , tolerations = None (List Kubernetes.Toleration.Type)
              }
          , Image = Image
          , Resources = Resources
          }

let Flags =
      { Type =
          { enableSpotInterruptionDraining : Bool
          , enableScheduledEventDraining : Bool
          , deleteLocalData : Bool
          , dryRun : Bool
          , ignoreDaemonSets : Bool
          , cordonOnly : Bool
          , taintNode : Bool
          , jsonLogging : Bool
          }
      , default =
          { enableSpotInterruptionDraining = False
          , enableScheduledEventDraining = False
          , deleteLocalData = False
          , dryRun = False
          , ignoreDaemonSets = False
          , cordonOnly = False
          , taintNode = False
          , jsonLogging = False
          }
      }

let Knobs =
      { Type =
          { podTerminationGracePeriod : Optional Text
          , nodeTerminationGracePeriod : Optional Text
          }
      , default =
          { podTerminationGracePeriod = None Text
          , nodeTerminationGracePeriod = None Text
          }
      }

let Notifications =
      let Webhook =
            { Type =
                { url : Optional Text
                , proxy : Optional Text
                , headers : Optional Text
                , template : Optional Text
                }
            , default =
                { url = None Text
                , proxy = None Text
                , headers = None Text
                , template = None Text
                }
            }

      in  { Type = { webhook : Webhook.Type }
          , default.webhook = Webhook.default
          , Webhook = Webhook
          }

let Prometheus =
      { Type =
          { enable : Bool
          , endpoint : Text
          , port : Text
          , operator : Optional { interval : Text }
          }
      , default =
          { enable = False
          , endpoint = "kube-prometheus"
          , port = "9092"
          , operator = None { interval : Text }
          }
      }

in  { Type =
        { pod : Pod.Type
        , flags : Flags.Type
        , knobs : Knobs.Type
        , instanceMetadataURL : Optional Text
        , notifications : Notifications.Type
        , prometheus : Prometheus.Type
        }
    , default =
        { pod = Pod.default
        , flags = Flags.default
        , knobs = Knobs.default
        , instanceMetadataURL = None Text
        , notifications = Notifications.default
        , prometheus = Prometheus.default
        }
    , Pod = Pod
    , Flags = Flags
    , Knobs = Knobs
    , Notifications = Notifications
    , Prometheus = Prometheus
    }
