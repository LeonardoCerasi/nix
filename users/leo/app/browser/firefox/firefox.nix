{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  home.file.".mozilla/firefox/vzulbpwa.default/chrome/userChrome.css".source = ./userChrome.css;
}
