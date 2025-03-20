{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
  ];

  home.file.".librewolf/773hjn3d.default/chrome/userChrome.css".source = ./userChrome.css;
}
