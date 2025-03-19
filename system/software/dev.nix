{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gcc
    clang
    rustup
    cmake
    gnumake
    python3
    nodejs
    jdk
  ];
}
