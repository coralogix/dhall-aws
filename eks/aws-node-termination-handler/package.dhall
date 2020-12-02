{ kubernetes =
      ./kubernetes/package.dhall sha256:fd43a44abff479b588f37516d2c92878f56e66550d02efb56965828117748e92
    ? ./kubernetes/package.dhall
, Settings =
      ./Settings.dhall sha256:cb17d2a11e29445f41aabad4a9091a6803a483c63ed9130a73211fd5623ceb6d
    ? ./Settings.dhall
}
