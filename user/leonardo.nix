{ config, pkgs, ... }:

{
  imports = [
    ./app/nvim/nvim.nix
    ./app/terminal/kitty/kitty.nix
    ./app/latex.nix
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
    libreoffice-qt
    hunspell
    hunspellDicts.it_IT
    hunspellDicts.en_US
    hunspellDicts.fr-any
    hunspellDicts.de_DE
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
