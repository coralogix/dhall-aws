let imports = ../../../imports.dhall

let Kubernetes = imports.Kubernetes

let Prometheus = imports.Prometheus

let Prelude = imports.Prelude

let Common = ./Common.dhall

let optional-interval =
      λ(operator : Optional { interval : Text }) →
        Prelude.Optional.fold
          { interval : Text }
          operator
          (Optional Text)
          (λ(it : { interval : Text }) → Some it.interval)
          (None Text)

in  λ(common : Common.Type) →
      Prometheus.ServiceMonitor::{
      , spec = Prometheus.ServiceMonitorSpec::{
        , selector = Kubernetes.LabelSelector::{
          , matchLabels = Some common.labels.selector
          }
        , endpoints = Some
          [ Prometheus.Endpoint.Union.Port
              Prometheus.Endpoint.Port::{
              , port = common.settings.prometheus.port
              , interval = optional-interval common.settings.prometheus.operator
              }
          ]
        , namespaceSelector = Some
            (Prometheus.NamespaceSelector.Any { any = True })
        }
      , metadata = common.metadata ⫽ { labels = Some common.labels.prometheus }
      }
