let imports = ../../../imports.dhall

let Kubernetes = imports.Kubernetes

let Prometheus = imports.Prometheus

let Common = ./Common.dhall

in  λ(common : Common.Type) →
      Prometheus.PrometheusRule::{
      , metadata = common.metadata ⫽ { labels = Some common.labels.prometheus }
      , spec = Prometheus.PrometheusRuleSpec::{=}
      }
