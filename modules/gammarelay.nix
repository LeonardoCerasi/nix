{ pkgs, ...}:

{
  home.packages = with pkgs; [
    wl-gammarelay-rs
  ];

  # Configure systemd user service
  systemd.user.services.wl-gammarelay-rs = {
    Unit = {
      Description = "wl-gammarelay - Wayland gamma control";
      After = [ "graphical-session-pre.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.wl-gammarelay-rs}/bin/wl-gammarelay-rs";
      Restart = "on-failure";
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  wayland.windowManager.hyprland.settings.bind = [
    "SHIFT, XF86MonBrightnessUp, exec, busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n +500"
    "SHIFT, XF86MonBrightnessDown, exec, busctl --user -- call rs.wl-gammarelay / rs.wl.gammarelay UpdateTemperature n -500"
  ];
}
