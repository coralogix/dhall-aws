let imports = ../../../imports.dhall

let Kubernetes = imports.Kubernetes

let Common = ./Common.dhall

in  λ(common : Common.Type) →
      Kubernetes.ServiceAccount::{ metadata = common.metadata }
