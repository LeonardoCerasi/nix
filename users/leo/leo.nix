{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo/";
  nixver = "24.11";
in
{
  imports = [
    ./fonts.nix
    ./app/nvim/nvim.nix
    ./app/terminal/kitty/kitty.nix
    ./app/terminal/zsh/zsh.nix
    ./app/browser/librewolf/librewolf.nix
    # ./app/browser/vivaldi.nix
    ./app/latex.nix
    # ./app/libreoffice.nix
    ./app/comms.nix
    ./app/git.nix
    ./app/window-manager/hypr/hyprland.nix
    # ./app/eww/eww.nix
  ];

  home.username = usrname;
  home.homeDirectory = homefld;

  home. stateVersion = nixver;
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # scripts
  home.file."bin".source = ./bin;
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
