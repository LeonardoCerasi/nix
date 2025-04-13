{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo/";
in
{
  imports =
  [
    ../default.nix

    # <--- local conf --->
    ./fonts.nix
    ./kitty.nix

    # <--- modules --->
    ../../modules/browser/librewolf.nix
    ../../modules/wm/hypr/conf.nix
  ];

  home.username = usrname;
  home.homeDirectory = homefld;
}
