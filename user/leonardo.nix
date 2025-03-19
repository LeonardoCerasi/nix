{ config, pkgs, ... }:

{
  imports = [
    ./app/nvim/nvim.nix
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
    texlive.combined.scheme-full
    zathura
    xdotool # for zathura in neovim
    pstree # for zathura in neovim
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
    openrazer-daemon
    polychromatic

    telegram-desktop
    signal-desktop
    nautilus
    spotify
    proton-pass

    # instant-reference tool
    exiftool
    zenity
    xsel
  ];
}
