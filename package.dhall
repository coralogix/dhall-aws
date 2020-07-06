{ ec2 =
      ./ec2/package.dhall sha256:33f972c3fc259be8474b48f176f5a0e33e8440a3508f228b06da47c77c4189ed
    ? ./ec2/package.dhall
, eks =
      ./eks/package.dhall sha256:41da45773969056f5fed9af1d6dd019aebf80f31b64d51629d035c1c8189ebe3
    ? ./eks/package.dhall
, iam =
      ./iam/package.dhall sha256:65c46bd012183fcd601ff00ab0f5da5d14743f647f997d41ef90d2138ef0fe51
    ? ./iam/package.dhall
}
