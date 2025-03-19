{ pkgs, ... }:

{
  imports = [
    ./app/nvim/nvim.nix
    ./app/terminal/kitty/kitty.nix
    ./app/browser/firefox/firefox.nix
    ./app/browser/vivaldi
    ./app/latex.nix
    ./app/libreoffice.nix
    ./app/comms.nix
  ];
  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo/";

  home. stateVersion = "24.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # programs

  home.packages = with pkgs; [
    thunderbird
    qbittorrent
    insync
    insync-nautilus
    notesnook
    obsidian
    filezilla
    nautilus
    spotify
    proton-pass
  ];
}
