{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";

  def_conf = [ ../default.nix ];
  usr_modules = [
    ../../modules/usr/browser/firefox/firefox.nix
    ../../modules/usr/browser/vivaldi.nix
    ../../modules/usr/libreoffice.nix
    ../../modules/usr/vlc.nix
  ];
in
{
  imports = def_conf ++ usr_modules;
  home.username = usrname;
  home.homeDirectory = homefld;

  home.packages = with pkgs; [
    qbittorrent
    notesnook
    obsidian
    filezilla
  ];
}
