{ pkgs, ... }:

{
  home.packages = with pkgs; [
    librewolf
  ];

  # home.file.".librewolf/pu4fepw1.default/chrome/userChrome.css".source = ./userChrome.css;
}
