{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Nordic";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "Nordic";
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
      ];
      config.common.default = "*";
    };
  };
}
