{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpaper
    wofi
    eww
    rose-pine-hyprcursor
  ];

  programs.hyprland = {
    enable = true;
  };
}
