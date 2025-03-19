{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
  ];

  home.file.".librewolf/1w3mx655.default/chrome/userChrome.css".source = ./userChrome.css;
}
