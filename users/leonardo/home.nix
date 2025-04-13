{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";
in
{
  imports =
    [
      ../default.nix

      # <--- modules --->
      ../../modules/browser/firefox/firefox.nix
      ../../modules/browser/vivaldi.nix
      ../../modules/libreoffice.nix
  ];
  home.username = usrname;
  home.homeDirectory = homefld;

  home.packages = with pkgs; [
    qbittorrent
    notesnook
    obsidian
    filezilla
  ];
}
