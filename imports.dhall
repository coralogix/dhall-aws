{ Prelude =
      /usr/share/dhall/dhall-lang/dhall-lang/v17.0.0/Prelude/package.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
    ? https://prelude.dhall-lang.org/v17.0.0/package.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
, Kubernetes =
      /usr/share/dhall/dhall-lang/dhall-kubernetes/v4.0.0/package.dhall sha256:d9eac5668d5ed9cb3364c0a39721d4694e4247dad16d8a82827e4619ee1d6188
    ? https://raw.githubusercontent.com/dhall-lang/dhall-kubernetes/v4.0.0/package.dhall sha256:d9eac5668d5ed9cb3364c0a39721d4694e4247dad16d8a82827e4619ee1d6188
, Prometheus =
    let import =
            /usr/share/dhall/coralogix/dhall-prometheus-operator/v5.0.1/package.dhall sha256:df8b3e399971ffba9d21c0bd1fe590866c549f1955e692131692295c0ac59a54
          ? https://raw.githubusercontent.com/coralogix/dhall-prometheus-operator/v5.0.1/package.dhall sha256:df8b3e399971ffba9d21c0bd1fe590866c549f1955e692131692295c0ac59a54

    in  import.v1
}
