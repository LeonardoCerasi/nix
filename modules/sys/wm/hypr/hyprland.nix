{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpaper
    rose-pine-hyprcursor
    wofi
  ];

  programs.hyprland = {
    enable = true;
  };
}
