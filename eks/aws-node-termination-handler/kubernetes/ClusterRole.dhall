let imports = ../../../imports.dhall

let Kubernetes = imports.Kubernetes

let Common = ./Common.dhall

in    λ(common : Common.Type)
    → Kubernetes.ClusterRole::{
      , metadata = common.metadata ⫽ { namespace = None Text }
      , rules =
          Some
            [ Kubernetes.PolicyRule::{
              , apiGroups = Some [ "" ]
              , resources = Some [ "nodes" ]
              , verbs = [ "get", "patch", "update" ]
              }
            , Kubernetes.PolicyRule::{
              , apiGroups = Some [ "" ]
              , resources = Some [ "pods" ]
              , verbs = [ "list" ]
              }
            , Kubernetes.PolicyRule::{
              , apiGroups = Some [ "" ]
              , resources = Some [ "pods/eviction" ]
              , verbs = [ "create" ]
              }
            , Kubernetes.PolicyRule::{
              , apiGroups = Some [ "extensions" ]
              , resources = Some [ "replicasets", "daemonsets" ]
              , verbs = [ "get" ]
              }
            , Kubernetes.PolicyRule::{
              , apiGroups = Some [ "apps" ]
              , resources = Some [ "daemonsets" ]
              , verbs = [ "get", "delete" ]
              }
            ]
      }
