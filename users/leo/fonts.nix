{ pkgs, ... }:

{
    home.packages = with pkgs; [
    ubuntu-sans-mono
    # noto-fonts-emoji
    font-awesome
  ];
  
  fonts.fontconfig = {
    enable = true;

    defaultFonts = {
      sansSerif = [ "Ubuntu Sans Mono" ];
      # emoji = [ "Noto Color Emoji" ];
    };
  };
}
