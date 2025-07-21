{ pkgs, ... }:

{
  home.packages = with pkgs; [
    texlive.combined.scheme-full
    zathura
    xdotool # for zathura in neovim
    pstree # for zathura in neovim

    # instant-reference tool
    exiftool
    zenity
    xsel
  ];

}
