{ ... }:

let
  terminal = "kitty";
  menu = "wofi --style $HOME/.config/hypr/wofi/style_mocha.css --show drun";
  browser = "librewolf";
  comms = "telegram-desktop";

  main = "SUPER";
in
{
  wayland.windowManager.hyprland.settings = {

     bind = [

      # <--- launch binds --->

      "${main}, RETURN, exec, ${terminal}"
      "${main} SHIFT, E, exit,"
      "${main} SHIFT, Q, killactive"
      "${main}, SPACE, exec, ${menu}"
      "${main}, F, exec, ${browser}"
      "${main}, T, exec, ${comms}"

      # "${main}, M, exec, /home/leonardo/bin/dashboard.sh"

      # <--- nav binds --->

      "${main}, H, movefocus, l"
      "${main}, L, movefocus, r"
      "${main}, K, movefocus, u"
      "${main}, J, movefocus, d"

      # <--- workspaces --->

      "${main}, 1, workspace, 1"
      "${main}, 2, workspace, 2"
      "${main}, 3, workspace, 3"
      "${main}, 4, workspace, 4"
      "${main}, 5, workspace, 5"
      "${main}, 6, workspace, 6"
      "${main}, 7, workspace, 7"
      "${main}, 8, workspace, 8"
      "${main}, 9, workspace, 9"
      "${main}, 0, workspace, 10"

      "${main} SHIFT, 1, movetoworkspace, 1"
      "${main} SHIFT, 2, movetoworkspace, 2"
      "${main} SHIFT, 3, movetoworkspace, 3"
      "${main} SHIFT, 4, movetoworkspace, 4"
      "${main} SHIFT, 5, movetoworkspace, 5"
      "${main} SHIFT, 6, movetoworkspace, 6"
      "${main} SHIFT, 7, movetoworkspace, 7"
      "${main} SHIFT, 8, movetoworkspace, 8"
      "${main} SHIFT, 9, movetoworkspace, 9"
      "${main} SHIFT, 0, movetoworkspace, 10"

      # <--- media binds --->

      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"

      # <--- screen binds --->

      ", XF86MonBrightnessUp, exec, brightnessctl s 10%+"
      ", XF86MonBrightnessDown, exec, brightnessctl s 10%-"

    ];
  };
}
