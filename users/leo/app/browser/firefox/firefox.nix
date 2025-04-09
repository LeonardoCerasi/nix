{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
  ];

  home.file.".mozilla/firefox/h015lsuz.default/chrome/userChrome.css".source = ./userChrome.css;
}
