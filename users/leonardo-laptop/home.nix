{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo/";

  def_conf = [ ../default.nix ];
  loc_modules = [
    ./fonts.nix
    ./kitty.nix
  ];
  usr_modules = [
    ../../modules/usr/browser/librewolf.nix
    ../../modules/usr/gammarelay.nix
    ../../modules/usr/yazi.nix
    ../../modules/usr/music.nix
  ];
  sys_modules = [
    ../../modules/sys/wm/hypr/conf.nix
  ];
in
{
  imports = def_conf ++ loc_modules ++ usr_modules ++ sys_modules;
  home.username = usrname;
  home.homeDirectory = homefld;
}
