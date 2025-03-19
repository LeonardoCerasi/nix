{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  programs.firefox = {
    enable = true;
  };

  home.file.".mozilla/firefox/1mx60e19.default/chrome/userChrome.css" = ./userChrome.css;
}
