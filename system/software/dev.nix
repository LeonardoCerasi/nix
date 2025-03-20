{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # C & C++
    gcc
    clang
    # Rust
    rustup
    # make
    cmake
    gnumake
    # Python
    python3
    # Node
    nodejs
    # Java
    jdk
    # Haskell
    ghc
    haskellPackages.haskell-language-server
    haskellPackages.cabal-install
    haskellPackages.stack
  ];
}
