let
  nixpkgs = import (
    let
      version = "eca0d38e22981ba54f3185b1ff16a5e67d483776";
    in builtins.fetchTarball {
      name   = "nixpkgs-${version}";
      url    = "https://github.com/NixOS/nixpkgs/archive/${version}.tar.gz";
      sha256 = "162ip8l5x5v1wwkdq7xrhqc9155c5i294l7rl18r8skmrncjad12";
      }
    ) {};

easy-dhall-nix = import (
    let
      version = "1.32.0";
    in nixpkgs.fetchFromGitHub {
      owner  = "justinwoo";
      repo   = "easy-dhall-nix";
      rev    = "62f6ab3eec5a2c0bf62f604f48cd15465b10023a";
      sha256 = "07lvvc3yvjy6ji3z320f467n485hzwwa9ldwi6zylxcb6a2jb7i0";
      }
    ) {};

in nixpkgs.mkShell {
  buildInputs = [
    easy-dhall-nix.dhall-simple
    nixpkgs.gitAndTools.lefthook
  ];
}
