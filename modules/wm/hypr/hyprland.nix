{ pkgs, ... }:

{
 environment.systemPackages = with pkgs; [
    brightnessctl
    hyprpaper
    rose-pine-hyprcursor
  ];

  programs.hyprland = {
    enable = true;
  };
}
