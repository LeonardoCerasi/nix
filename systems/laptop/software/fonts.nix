{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      ubuntu-sans-mono
      noto-fonts-emoji
    ];

    fontconfig = {
      enable = true;

      defaultFonts = {
        sansSerif = [ "Ubuntu Sans Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
