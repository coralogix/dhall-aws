{ Prelude =
      /usr/share/dhall/dhall-lang/dhall-lang/v16.0.0/Prelude/package.dhall
    ? https://prelude.dhall-lang.org/v16.0.0/package.dhall sha256:7e2b87add393288298baabc73119601182d04630b9989bdb9ac0822dc0863b38
, Kubernetes =
      /usr/share/dhall/dhall-lang/dhall-kubernetes/v4.0.0/package.dhall
    ? https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/v4.0.0/package.dhall sha256:d9eac5668d5ed9cb3364c0a39721d4694e4247dad16d8a82827e4619ee1d6188
, Prometheus =
      ( /usr/share/dhall/coralogix/dhall-prometheus-operator/v4.0.3/package.dhall
      ).v1
    ? ( https://raw.githubusercontent.com/coralogix/dhall-prometheus-operator/v4.0.3/package.dhall sha256:df7010161c933153eb6e29fd5bf9620014784d8fc95fbdc72129ef38fb1c1863
      ).v1
}
