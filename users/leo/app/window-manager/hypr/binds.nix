{ ... }:

{
  wayland.windowManager.hyprland.settings = {

    # <--- mouse binds --->
    bindm = [
      # ALT + leftclick
      "ALT, mouse:272, movewindow"
      # ALT + rightclick
      "ALT, mouse:273, resizewindow"
    ];

    # <--- launch binds --->
    bind = [
      "SUPER, RETURN, exec, kitty"
      "SUPER SHIFT, E, exit,"
    ];
  };
}
