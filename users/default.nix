{ pkgs, ... }:

let
  nixver = "24.11";
in
{
  imports =
    [
      # <--- modules --->
      ../modules/nvim/nvim.nix
      ../modules/zsh/zsh.nix
      ../modules/kitty/kitty.nix
      ../modules/latex.nix
      ../modules/comms.nix
      ../modules/git.nix
  ];

  home. stateVersion = nixver;
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
