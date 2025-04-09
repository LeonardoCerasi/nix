{ ... }:

{
  programs.eww = {
    enable = true;
    configDir = ./src;
  };

  home.file."bin/dashboard.sh".source = ./src/scripts/dashboard.sh;
}
