{ ec2 =
      ./ec2/package.dhall sha256:d72b1dfa57b0a46ed5112ffa71a260b2527a2a552c2024b321fa30b1384d6a7a
    ? ./ec2/package.dhall
, eks =
      ./eks/package.dhall sha256:41da45773969056f5fed9af1d6dd019aebf80f31b64d51629d035c1c8189ebe3
    ? ./eks/package.dhall
, iam =
      ./iam/package.dhall sha256:65c46bd012183fcd601ff00ab0f5da5d14743f647f997d41ef90d2138ef0fe51
    ? ./iam/package.dhall
, map =
      ./map/package.dhall sha256:65502e34c5706b8552d0ae8f672b1abe11fa91c0c49a3acb5de6d4f3faf4c03c
    ? ./map/package.dhall
}
