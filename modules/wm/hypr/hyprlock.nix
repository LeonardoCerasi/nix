{ ... }:

{
  programs.hyprlock = {
    enable = true;


    extraConfig = ''
# BACKGROUND
background {
    monitor =
    #path = screenshot
    path = ~/imgs/lock.jpg
    #color = $background
    blur_passes = 1
    contrast = 1
    brightness = 0.5
    vibrancy = 0.2
    vibrancy_darkness = 0.2
}

# GENERAL
general {
    no_fade_in = true
    no_fade_out = true
    hide_cursor = false
    grace = 0
    disable_loading_bar = true
}

# INPUT FIELD
input-field {
    monitor =
    size = 250, 60
    outline_thickness = 2
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = rgba(0, 0, 0, 0)
    inner_color = rgba(0, 0, 0, 0.2)
    font_color = rgb(183, 189, 248)
    fade_on_empty = false
    rounding = -1
    check_color = rgb(237, 135, 150)
    placeholder_text =
    hide_input = false
    position = 0, -200
    halign = center
    valign = center
}

# DATE
label {
  monitor =
  text = cmd[update:1000] echo "$(date +"%Y/%m/%d")"
  color = rgb(145, 215, 227)
  font_size = 22
  font_family = Ubuntu Sans Mono
  position = 0, 300
  halign = center
  valign = center
}

# TIME
label {
  monitor = 
  text = cmd[update:1000] echo "$(date +"%H:%M")"
  color = rgb(145, 215, 227)
  font_size = 95
  font_family = Ubuntu Sans Mono Bold
  position = 0, 200
  halign = center
  valign = center
}
    '';
  };
}
