let InstanceType = ./Type.dhall

let render
    : InstanceType → Text
    = λ(instanceType : InstanceType) →
        merge
          { c5-large = "c5.large"
          , c5-xlarge = "c5.xlarge"
          , c5-2xlarge = "c5.2xlarge"
          , c5-4xlarge = "c5.4xlarge"
          , c5a-large = "c5a.large"
          , c5a-xlarge = "c5a.xlarge"
          , c5a-2xlarge = "c5a.2xlarge"
          , c5a-4xlarge = "c5a.4xlarge"
          , c5d-large = "c5d.large"
          , c5d-xlarge = "c5d.xlarge"
          , c5d-2xlarge = "c5d.2xlarge"
          , c5d-4xlarge = "c5d.4xlarge"
          , c5n-large = "c5n.large"
          , c5n-xlarge = "c5n.xlarge"
          , c5n-2xlarge = "c5n.2xlarge"
          , c5n-4xlarge = "c5n.4xlarge"
          , c6g-medium = "c6g.medium"
          , c6g-large = "c6g.large"
          , c6g-xlarge = "c6g.xlarge"
          , c6g-2xlarge = "c6g.2xlarge"
          , c6g-4xlarge = "c6g.4xlarge"
          , c6gd-medium = "c6gd.medium"
          , c6gd-large = "c6gd.large"
          , c6gd-xlarge = "c6gd.xlarge"
          , c6gd-2xlarge = "c6gd.2xlarge"
          , c6gd-4xlarge = "c6gd.4xlarge"
          , c6gn-medium = "c6gn.medium"
          , c6gn-large = "c6gn.large"
          , c6gn-xlarge = "c6gn.xlarge"
          , c6gn-2xlarge = "c6gn.2xlarge"
          , c6gn-4xlarge = "c6gn.4xlarge"
          , m4-large = "m4.large"
          , m4-xlarge = "m4.xlarge"
          , m4-2xlarge = "m4.2xlarge"
          , m4-4xlarge = "m4.4xlarge"
          , m5-large = "m5.large"
          , m5-xlarge = "m5.xlarge"
          , m5-2xlarge = "m5.2xlarge"
          , m5-4xlarge = "m5.4xlarge"
          , m5d-large = "m5d.large"
          , m5d-xlarge = "m5d.xlarge"
          , m5d-2xlarge = "m5d.2xlarge"
          , m5d-4xlarge = "m5d.4xlarge"
          , m5a-large = "m5a.large"
          , m5a-xlarge = "m5a.xlarge"
          , m5a-2xlarge = "m5a.2xlarge"
          , m5a-4xlarge = "m5a.4xlarge"
          , m5ad-large = "m5ad.large"
          , m5ad-xlarge = "m5ad.xlarge"
          , m5ad-2xlarge = "m5ad.2xlarge"
          , m5ad-4xlarge = "m5ad.4xlarge"
          , m5n-large = "m5n.large"
          , m5n-xlarge = "m5n.xlarge"
          , m5n-2xlarge = "m5n.2xlarge"
          , m5n-4xlarge = "m5n.4xlarge"
          , m5dn-large = "m5dn.large"
          , m5dn-xlarge = "m5dn.xlarge"
          , m5dn-2xlarge = "m5dn.2xlarge"
          , m5dn-4xlarge = "m5dn.4xlarge"
          , m6g-medium = "m6g.medium"
          , m6g-large = "m6g.large"
          , m6g-xlarge = "m6g.xlarge"
          , m6g-2xlarge = "m6g.2xlarge"
          , m6g-4xlarge = "m6g.4xlarge"
          , m6gd-medium = "m6gd.medium"
          , m6gd-large = "m6gd.large"
          , m6gd-xlarge = "m6gd.xlarge"
          , m6gd-2xlarge = "m6gd.2xlarge"
          , m6gd-4xlarge = "m6gd.4xlarge"
          , r5-large = "r5.large"
          , r5-xlarge = "r5.xlarge"
          , r5-2xlarge = "r5.2xlarge"
          , r5-4xlarge = "r5.4xlarge"
          , r5d-large = "r5d.large"
          , r5d-xlarge = "r5d.xlarge"
          , r5d-2xlarge = "r5d.2xlarge"
          , r5d-4xlarge = "r5d.4xlarge"
          , r5a-large = "r5a.large"
          , r5a-xlarge = "r5a.xlarge"
          , r5a-2xlarge = "r5a.2xlarge"
          , r5a-4xlarge = "r5a.4xlarge"
          , r5ad-large = "r5ad.large"
          , r5ad-xlarge = "r5ad.xlarge"
          , r5ad-2xlarge = "r5ad.2xlarge"
          , r5ad-4xlarge = "r5ad.4xlarge"
          , r5n-large = "r5n.large"
          , r5n-xlarge = "r5n.xlarge"
          , r5n-2xlarge = "r5n.2xlarge"
          , r5n-4xlarge = "r5n.4xlarge"
          , r5dn-large = "r5dn.large"
          , r5dn-xlarge = "r5dn.xlarge"
          , r5dn-2xlarge = "r5dn.2xlarge"
          , r5dn-4xlarge = "r5dn.4xlarge"
          , r6g-medium = "r6g.medium"
          , r6g-large = "r6g.large"
          , r6g-xlarge = "r6g.xlarge"
          , r6g-2xlarge = "r6g.2xlarge"
          , r6g-4xlarge = "r6g.4xlarge"
          , r6gd-medium = "r6gd.medium"
          , r6gd-large = "r6gd.large"
          , r6gd-xlarge = "r6gd.xlarge"
          , r6gd-2xlarge = "r6gd.2xlarge"
          , r6gd-4xlarge = "r6gd.4xlarge"
          , t3-nano = "t3.nano"
          , t3-micro = "t3.micro"
          , t3-small = "t3.small"
          , t3-medium = "t3.medium"
          , t3-large = "t3.large"
          , t3-xlarge = "t3.xlarge"
          , t3-2xlarge = "t3.2xlarge"
          , t3a-nano = "t3a.nano"
          , t3a-micro = "t3a.micro"
          , t3a-small = "t3a.small"
          , t3a-medium = "t3a.medium"
          , t3a-large = "t3a.large"
          , t3a-xlarge = "t3a.xlarge"
          , t3a-2xlarge = "t3a.2xlarge"
          , t4g-nano = "t4g.nano"
          , t4g-micro = "t4g.micro"
          , t4g-small = "t4g.small"
          , t4g-medium = "t4g.medium"
          , t4g-large = "t4g.large"
          , t4g-xlarge = "t4g.xlarge"
          , t4g-2xlarge = "t4g.2xlarge"
          , x2gd-medium = "x2gd.medium"
          , x2gd-large = "x2gd.large"
          , x2gd-xlarge = "x2gd.xlarge"
          , x2gd-2xlarge = "x2gd.2xlarge"
          , x2gd-4xlarge = "x2gd.4xlarge"
          }
          instanceType

in  render
