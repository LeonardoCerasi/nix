{ pkgs, nix-version, ... }:

{
  imports = [ ../modules/usr/default ];

  home.stateVersion = nix-version;
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # scripts
  home.file."bin".source = ../bin;
  home.file."bin".recursive = true;

  home.packages = with pkgs; [
    thunderbird
    insync
    insync-nautilus
    nautilus
    spotify
    proton-pass
  ];
}
