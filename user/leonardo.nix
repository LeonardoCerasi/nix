{ pkgs, ... }:

{
  imports = [
    ./app/nvim/nvim.nix
    ./app/terminal/kitty/kitty.nix
    ./app/terminal/zsh/zsh.nix
    ./app/browser/librewolf/librewolf.nix
    ./app/browser/vivaldi.nix
    ./app/latex.nix
    ./app/libreoffice.nix
    ./app/comms.nix
    ./app/git.nix
  ];
  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo/";

  home. stateVersion = "24.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # scripts
  home.file."bin".source = ./bin;
  home.file."bin".recursive = true;

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
