{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
  };

  home.file.".config/kitty".source = ./.;
  home.file.".config/kitty".recursive = true;
}
