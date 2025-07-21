{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;

    settings = {
      background_opacity = 0.80;

      font_family = "UbuntuSansMono Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      cursor_shape = "beam";

      include = "current-theme.conf";
    };
  };

  home.file.".config/kitty/current-theme.conf".source = ./current-theme.conf;
}
