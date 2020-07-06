{ kubernetes =
      ./kubernetes/package.dhall sha256:fd43a44abff479b588f37516d2c92878f56e66550d02efb56965828117748e92
    ? ./kubernetes/package.dhall
, Settings =
      ./Settings.dhall sha256:fa049957abc2fb82877ae792a720ae57ec94589b9e9aac67ad8a6c61f1269181
    ? ./Settings.dhall
}
