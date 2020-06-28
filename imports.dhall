{ Prelude =
      /usr/share/dhall/dhall-lang/dhall-lang/v15.0.0/Prelude/package.dhall
    ? https://prelude.dhall-lang.org/v15.0.0/package.dhall sha256:6b90326dc39ab738d7ed87b970ba675c496bed0194071b332840a87261649dcd
, Kubernetes =
      /usr/share/dhall/dhall-lang/dhall-kubernetes/381306bcc3fd87aafe042c23bb66fe58227b85f4/package.dhall
    ? https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/381306bcc3fd87aafe042c23bb66fe58227b85f4/package.dhall sha256:39fa32f6cbdd341cfd2be0aec017c7f6eb554a58bf0262ae222badf3b9c348c0
, Prometheus =
      ( /usr/share/dhall/coralogix/dhall-prometheus-operator/v4.0.1/package.dhall sha256:bcfe5eed190f43f737a09bb2e40975cfd6fabc1f026c6475b012c263502a6210
      ).v1
    ? ( https://raw.githubusercontent.com/coralogix/dhall-prometheus-operator/v4.0.1/package.dhall sha256:bcfe5eed190f43f737a09bb2e40975cfd6fabc1f026c6475b012c263502a6210
      ).v1
}
