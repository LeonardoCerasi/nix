{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vlc
    libvlc
  ];
}
