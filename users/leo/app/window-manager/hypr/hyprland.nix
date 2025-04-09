{ ... }:

{
  imports = [
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = "eDP-1, 1920x1080@60, 0x0, 1";

      # <--- behavior --->

      input = {
        kb_layout = "it";
        follow_mouse = 0;
        touchpad.natural_scroll = true;
        numlock_by_default = true;
      };

      gestures = {
        workspace_swipe = false;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;

        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      # <--- env vars --->

      env = [
        "HYPRCURSOR_SIZE, 24"
      ];

      # <--- appearance --->

      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        resize_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = 0.1696;
        };
      };
    };
  };
}
