{ pkgs, ... }:

{
  imports = [
    ./gnome.nix
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
  };
  services.xserver.excludePackages = [ pkgs.xterm ]; 
}
