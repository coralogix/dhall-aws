let imports = ../../../imports.dhall

let Prelude = imports.Prelude

let Kubernetes = imports.Kubernetes

let Common = ./Common.dhall

in    λ(common : Common.Type)
    → λ(serviceAccount : Kubernetes.ServiceAccount.Type)
    → Kubernetes.DaemonSet::{
      , metadata = common.metadata
      , spec = Some Kubernetes.DaemonSetSpec::{
        , selector = Kubernetes.LabelSelector::{
          , matchLabels = Some common.labels.selector
          }
        , updateStrategy = Some Kubernetes.DaemonSetUpdateStrategy::{
          , type = Some "RollingUpdate"
          }
        , template = Kubernetes.PodTemplateSpec::{
          , metadata = common.metadata
          , spec =
              let volumes =
                    { uptime = Kubernetes.Volume::{
                      , name = "uptime"
                      , hostPath = Some Kubernetes.HostPathVolumeSource::{
                        , path = common.settings.pod.procUptimeFile
                        }
                      }
                    }

              in  Some
                    Kubernetes.PodSpec::{
                    , volumes = Some [ volumes.uptime ]
                    , priorityClassName = Some "system-node-critical"
                    , affinity = Some Kubernetes.Affinity::{
                      , nodeAffinity = Some Kubernetes.NodeAffinity::{
                        , requiredDuringSchedulingIgnoredDuringExecution = Some Kubernetes.NodeSelector::{
                          , nodeSelectorTerms =
                            [ Kubernetes.NodeSelectorTerm::{
                              , matchExpressions = Some
                                [ Kubernetes.NodeSelectorRequirement::{
                                  , key = "beta.kubernetes.io/os"
                                  , operator = "In"
                                  , values = Some [ "linux" ]
                                  }
                                , Kubernetes.NodeSelectorRequirement::{
                                  , key = "beta.kubernetes.io/arch"
                                  , operator = "In"
                                  , values = Some [ "amd64" ]
                                  }
                                ]
                              }
                            ]
                          }
                        }
                      }
                    , serviceAccountName = Some serviceAccount.metadata.name
                    , hostNetwork = Some True
                    , containers =
                      [ Kubernetes.Container::{
                        , name = common.name
                        , image = Some
                            "${common.settings.pod.image.repository}:${common.settings.pod.image.tag}"
                        , imagePullPolicy = Some
                            common.settings.pod.image.pullPolicy
                        , volumeMounts = Some
                          [ Kubernetes.VolumeMount::{
                            , name = volumes.uptime.name
                            , mountPath = "/proc/uptime"
                            }
                          ]
                        , env =
                            let render =
                                  { bool =
                                        λ(bool : Bool)
                                      →       if bool

                                        then  Some "true"

                                        else  Some "false"
                                  , optional-text =
                                        λ(text : Optional Text)
                                      → Prelude.Optional.fold
                                          Text
                                          text
                                          (Optional Text)
                                          (λ(it : Text) → Some it)
                                          (Some "")
                                  }

                            in  Some
                                  [ Kubernetes.EnvVar::{
                                    , name = "NODE_NAME"
                                    , valueFrom = Some Kubernetes.EnvVarSource::{
                                      , fieldRef = Some Kubernetes.ObjectFieldSelector::{
                                        , fieldPath = "spec.nodeName"
                                        }
                                      }
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "POD_NAME"
                                    , valueFrom = Some Kubernetes.EnvVarSource::{
                                      , fieldRef = Some Kubernetes.ObjectFieldSelector::{
                                        , fieldPath = "metadata.name"
                                        }
                                      }
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "NAMESPACE"
                                    , valueFrom = Some Kubernetes.EnvVarSource::{
                                      , fieldRef = Some Kubernetes.ObjectFieldSelector::{
                                        , fieldPath = "metadata.namespace"
                                        }
                                      }
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "SPOT_POD_IP"
                                    , valueFrom = Some Kubernetes.EnvVarSource::{
                                      , fieldRef = Some Kubernetes.ObjectFieldSelector::{
                                        , fieldPath = "status.podIP"
                                        }
                                      }
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "DELETE_LOCAL_DATA"
                                    , value =
                                        render.bool
                                          common.settings.flags.deleteLocalData
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "IGNORE_DAEMON_SETS"
                                    , value =
                                        render.bool
                                          common.settings.flags.ignoreDaemonSets
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "GRACE_PERIOD"
                                    , value =
                                        let deprecated = Some "" in deprecated
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "POD_TERMINATION_GRACE_PERIOD"
                                    , value =
                                        render.optional-text
                                          common.settings.knobs.podTerminationGracePeriod
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "INSTANCE_METADATA_URL"
                                    , value =
                                        render.optional-text
                                          common.settings.instanceMetadataURL
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "NODE_TERMINATION_GRACE_PERIOD"
                                    , value =
                                        render.optional-text
                                          common.settings.knobs.nodeTerminationGracePeriod
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "WEBHOOK_URL"
                                    , value =
                                        render.optional-text
                                          common.settings.notifications.webhook.url
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "WEBHOOK_PROXY"
                                    , value =
                                        render.optional-text
                                          common.settings.notifications.webhook.proxy
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "WEBHOOK_HEADERS"
                                    , value =
                                        render.optional-text
                                          common.settings.notifications.webhook.headers
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "WEBHOOK_TEMPLATE"
                                    , value =
                                        render.optional-text
                                          common.settings.notifications.webhook.template
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "DRY_RUN"
                                    , value =
                                        render.bool common.settings.flags.dryRun
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "ENABLE_SPOT_INTERRUPTION_DRAINING"
                                    , value =
                                        render.bool
                                          common.settings.flags.enableSpotInterruptionDraining
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "ENABLE_SCHEDULED_EVENT_DRAINING"
                                    , value =
                                        render.bool
                                          common.settings.flags.enableScheduledEventDraining
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "CORDON_ONLY"
                                    , value =
                                        render.bool
                                          common.settings.flags.cordonOnly
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "JSON_LOGGING"
                                    , value =
                                        render.bool
                                          common.settings.flags.jsonLogging
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "ENABLE_PROMETHEUS_SERVER"
                                    , value =
                                        render.bool
                                          common.settings.prometheus.enable
                                    }
                                  , Kubernetes.EnvVar::{
                                    , name = "PROMETHEUS_SERVER_PORT"
                                    , value = Some common.settings.prometheus.port
                                    }
                                  ]
                        , resources =
                            let requests =
                                  Some
                                    ( toMap
                                        { cpu =
                                            common.settings.pod.resources.requests.cpu
                                        , memory =
                                            common.settings.pod.resources.requests.memory
                                        }
                                    )

                            let limits =
                                  Some
                                    ( toMap
                                        { cpu =
                                            common.settings.pod.resources.limits.cpu
                                        , memory =
                                            common.settings.pod.resources.limits.memory
                                        }
                                    )

                            in  Some
                                  Kubernetes.ResourceRequirements::{
                                  , requests = requests
                                  , limits = limits
                                  }
                        }
                      ]
                    , nodeSelector = common.settings.pod.nodeSelector
                    , tolerations = common.settings.pod.tolerations
                    }
          }
        }
      }
