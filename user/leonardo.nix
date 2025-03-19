{ pkgs, ... }:

{
  imports = [
    ./app/nvim/nvim.nix
    ./app/terminal/kitty/kitty.nix
    ./app/latex.nix
    ./app/libreoffice.nix
  ];
  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo/";

  home. stateVersion = "24.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # programs

  home.packages = with pkgs; [
    firefox
    vivaldi
    thunderbird
    qbittorrent
    insync
    insync-nautilus
    notesnook
    obsidian
    filezilla
    discord

    telegram-desktop
    signal-desktop
    nautilus
    spotify
    proton-pass
  ];
}
