let imports = ../../../imports.dhall

let Kubernetes = imports.Kubernetes

let Common = ./Common.dhall

in    λ(common : Common.Type)
    → λ(clusterRole : Kubernetes.ClusterRole.Type)
    → λ(serviceAccount : Kubernetes.ServiceAccount.Type)
    → Kubernetes.ClusterRoleBinding::{
      , metadata = common.metadata ⫽ { namespace = None Text }
      , roleRef =
          Kubernetes.RoleRef::{
          , kind = clusterRole.kind
          , name = clusterRole.metadata.name
          , apiGroup = "rbac.authorization.k8s.io"
          }
      , subjects =
          Some
            [ Kubernetes.Subject::{
              , kind = serviceAccount.kind
              , name = serviceAccount.metadata.name
              , namespace = serviceAccount.metadata.namespace
              }
            ]
      }
