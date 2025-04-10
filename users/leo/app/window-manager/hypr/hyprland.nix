{ ... }:

{
  imports = [
    ./binds.nix
    ./waybar.nix
    ./hyprlock.nix
  ];

  services.swaync = {
    enable = true;
  };


  home.file.".config/hypr/wofi".source = ./wofi;
  home.file.".config/hypr/wofi".recursive = true;

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      monitor = "eDP-1, 1920x1080@60, 0x0, 1";

      # <--- behavior --->

      input = {
        kb_layout = "it";
        follow_mouse = 2;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = "yes";
        };
      };

      cursor = {
        no_warps = true;
        inactive_timeout = 1;
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        background_color = "0x000000";
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;

        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
      };

      # <--- env vars --->

      env = [
        "HYPRCURSOR_SIZE, 24"
        "HYPRCURSOR_THEME, rose-pine-hyprcursor"
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

      # <--- auto-launch --->

      exec-once = [
        "hyprpaper"
        "hyprlock && hyprctl hyprpaper wallpaper ', ~/imgs/wallpaper.jpg'"
        "waybar"
        "swaync"

        # "eww daemon"
        # "eww open topbar"
      ];

    };
  };

  # <--- wallpaper --->

  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "~/imgs/wallpaper.jpg"
      ];
    };
  };

}
