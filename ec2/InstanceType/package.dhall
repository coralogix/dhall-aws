let InstanceType =
        ./Type.dhall sha256:947c7df4c40ab53aa7ffeb81f44758df918524fc6962ff985e81f9eb5f9e433d
      ? ./Type.dhall

in  { Type = InstanceType
    , render =
          ./render.dhall sha256:2ef944471004554b7725ebaa58b17d9fb070bdbd2dae7892cb842d18b876e307
        ? ./render.dhall
    , architecture =
          ./architecture.dhall sha256:835a70e672a857f0bee4520708aa3343b5bc821c79260ba65421304488cf9c06
        ? ./architecture.dhall
    , upsize =
          ./upsize.dhall sha256:58426c35d34c78fe86c93c384b50e7212634b28410134eb7685c9566b3326620
        ? ./upsize.dhall
    , specs =
          ./specs.dhall sha256:bb596699e5296c175bb8d38f9244191be9441d482789975d26d9639ce9a5cbb3
        ? ./specs.dhall
    , alternatives =
          ./alternatives.dhall sha256:7603f78c8beaf42d18a013faef4ad2b139683d702c17ce36cf3f5f9ef6ba2f8c
        ? ./alternatives.dhall
    , c5-large = InstanceType.c5-large
    , c5-xlarge = InstanceType.c5-xlarge
    , c5-2xlarge = InstanceType.c5-2xlarge
    , c5-4xlarge = InstanceType.c5-4xlarge
    , c5a-large = InstanceType.c5a-large
    , c5a-xlarge = InstanceType.c5a-xlarge
    , c5a-2xlarge = InstanceType.c5a-2xlarge
    , c5a-4xlarge = InstanceType.c5a-4xlarge
    , c5d-large = InstanceType.c5d-large
    , c5d-xlarge = InstanceType.c5d-xlarge
    , c5d-2xlarge = InstanceType.c5d-2xlarge
    , c5d-4xlarge = InstanceType.c5d-4xlarge
    , c5n-large = InstanceType.c5n-large
    , c5n-xlarge = InstanceType.c5n-xlarge
    , c5n-2xlarge = InstanceType.c5n-2xlarge
    , c5n-4xlarge = InstanceType.c5n-4xlarge
    , c6g-medium = InstanceType.c6g-medium
    , c6g-large = InstanceType.c6g-large
    , c6g-xlarge = InstanceType.c6g-xlarge
    , c6g-2xlarge = InstanceType.c6g-2xlarge
    , c6g-4xlarge = InstanceType.c6g-4xlarge
    , c6gd-medium = InstanceType.c6gd-medium
    , c6gd-large = InstanceType.c6gd-large
    , c6gd-xlarge = InstanceType.c6gd-xlarge
    , c6gd-2xlarge = InstanceType.c6gd-2xlarge
    , c6gd-4xlarge = InstanceType.c6gd-4xlarge
    , c6gn-medium = InstanceType.c6gn-medium
    , c6gn-large = InstanceType.c6gn-large
    , c6gn-xlarge = InstanceType.c6gn-xlarge
    , c6gn-2xlarge = InstanceType.c6gn-2xlarge
    , c6gn-4xlarge = InstanceType.c6gn-4xlarge
    , m4-large = InstanceType.m4-large
    , m4-xlarge = InstanceType.m4-xlarge
    , m4-2xlarge = InstanceType.m4-2xlarge
    , m4-4xlarge = InstanceType.m4-4xlarge
    , m5-large = InstanceType.m5-large
    , m5-xlarge = InstanceType.m5-xlarge
    , m5-2xlarge = InstanceType.m5-2xlarge
    , m5-4xlarge = InstanceType.m5-4xlarge
    , m5d-large = InstanceType.m5d-large
    , m5d-xlarge = InstanceType.m5d-xlarge
    , m5d-2xlarge = InstanceType.m5d-2xlarge
    , m5d-4xlarge = InstanceType.m5d-4xlarge
    , m5a-large = InstanceType.m5a-large
    , m5a-xlarge = InstanceType.m5a-xlarge
    , m5a-2xlarge = InstanceType.m5a-2xlarge
    , m5a-4xlarge = InstanceType.m5a-4xlarge
    , m5ad-large = InstanceType.m5ad-large
    , m5ad-xlarge = InstanceType.m5ad-xlarge
    , m5ad-2xlarge = InstanceType.m5ad-2xlarge
    , m5ad-4xlarge = InstanceType.m5ad-4xlarge
    , m5n-large = InstanceType.m5n-large
    , m5n-xlarge = InstanceType.m5n-xlarge
    , m5n-2xlarge = InstanceType.m5n-2xlarge
    , m5n-4xlarge = InstanceType.m5n-4xlarge
    , m5dn-large = InstanceType.m5dn-large
    , m5dn-xlarge = InstanceType.m5dn-xlarge
    , m5dn-2xlarge = InstanceType.m5dn-2xlarge
    , m5dn-4xlarge = InstanceType.m5dn-4xlarge
    , m6g-medium = InstanceType.m6g-medium
    , m6g-large = InstanceType.m6g-large
    , m6g-xlarge = InstanceType.m6g-xlarge
    , m6g-2xlarge = InstanceType.m6g-2xlarge
    , m6g-4xlarge = InstanceType.m6g-4xlarge
    , m6gd-medium = InstanceType.m6gd-medium
    , m6gd-large = InstanceType.m6gd-large
    , m6gd-xlarge = InstanceType.m6gd-xlarge
    , m6gd-2xlarge = InstanceType.m6gd-2xlarge
    , m6gd-4xlarge = InstanceType.m6gd-4xlarge
    , r5-large = InstanceType.r5-large
    , r5-xlarge = InstanceType.r5-xlarge
    , r5-2xlarge = InstanceType.r5-2xlarge
    , r5-4xlarge = InstanceType.r5-4xlarge
    , r5a-large = InstanceType.r5a-large
    , r5a-xlarge = InstanceType.r5a-xlarge
    , r5a-2xlarge = InstanceType.r5a-2xlarge
    , r5a-4xlarge = InstanceType.r5a-4xlarge
    , r5n-large = InstanceType.r5n-large
    , r5n-xlarge = InstanceType.r5n-xlarge
    , r5n-2xlarge = InstanceType.r5n-2xlarge
    , r5n-4xlarge = InstanceType.r5n-4xlarge
    , r6g-medium = InstanceType.r6g-medium
    , r6g-large = InstanceType.r6g-large
    , r6g-xlarge = InstanceType.r6g-xlarge
    , r6g-2xlarge = InstanceType.r6g-2xlarge
    , r6g-4xlarge = InstanceType.r6g-4xlarge
    , r6gd-medium = InstanceType.r6gd-medium
    , r6gd-large = InstanceType.r6gd-large
    , r6gd-xlarge = InstanceType.r6gd-xlarge
    , r6gd-2xlarge = InstanceType.r6gd-2xlarge
    , r6gd-4xlarge = InstanceType.r6gd-4xlarge
    , t3-nano = InstanceType.t3-nano
    , t3-micro = InstanceType.t3-micro
    , t3-small = InstanceType.t3-small
    , t3-medium = InstanceType.t3-medium
    , t3-large = InstanceType.t3-large
    , t3-xlarge = InstanceType.t3-xlarge
    , t3-2xlarge = InstanceType.t3-2xlarge
    , t3a-nano = InstanceType.t3a-nano
    , t3a-micro = InstanceType.t3a-micro
    , t3a-small = InstanceType.t3a-small
    , t3a-medium = InstanceType.t3a-medium
    , t3a-large = InstanceType.t3a-large
    , t3a-xlarge = InstanceType.t3a-xlarge
    , t3a-2xlarge = InstanceType.t3a-2xlarge
    , t4g-nano = InstanceType.t4g-nano
    , t4g-micro = InstanceType.t4g-micro
    , t4g-small = InstanceType.t4g-small
    , t4g-medium = InstanceType.t4g-medium
    , t4g-large = InstanceType.t4g-large
    , t4g-xlarge = InstanceType.t4g-xlarge
    , t4g-2xlarge = InstanceType.t4g-2xlarge
    , x2gd-medium = InstanceType.x2gd-medium
    , x2gd-large = InstanceType.x2gd-large
    , x2gd-xlarge = InstanceType.x2gd-xlarge
    , x2gd-2xlarge = InstanceType.x2gd-2xlarge
    , x2gd-4xlarge = InstanceType.x2gd-4xlarge
    }
