{ ... }:

{
  programs.waybar = {
    enable = true;

    settings = {

      bar = {

        name = "bar";
        layer = "top";
        position = "bottom";
        height = 30;

        # <--- modules --->

        modules-left = [
          "power-profiles-daemon"
          "battery#bat1"
          "battery#bat2"
          "memory"
          "cpu"
          "temperature"
          "pulseaudio"
          # "backlight"
          # "idle_inhibitor"
        ];

        modules-center = [ "wlr/taskbar" "hyprland/workspaces" ];

        modules-right = [
          "network#vpn"
          "network#wifi"
          "network#ethernet"
          "network#disconnected"
          "tray"
          "clock"
        ];

        # <--- config --->

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };

        "clock" = {
          interval = 1;
          format = "<b>{:%H:%M:%S}</b>";
          format-alt = "<b>{:%Y-%m-%d}</b>";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          format = " {usage}%";
          tooltip = false;
        };

        "memory" = {
          format = " {}%";
          tooltip-format = "{used:0.1f}G / {total:0.1f}G used";
        };

        "temperature" = {
          critical-threshold = 60;
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" "" "" ];
        };

        "backlight" = {
          device = "intel_backlight";
          interval = 1;
          on-scroll-down = "brightlight -pd 1";
          on-scroll-up = "brightlight -pi 1";
          format = "{icon} {percent}%";
          format-icons = [ "" "" ];
          on-click = "wdisplays";
        };

        "battery#bat1" = {
          bat = "BAT0";
          adapter = "AC";
          interval = 10;
          full-at = 99;
          states = {
              full = 100;
              good = 99;
              empty = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-empty = "";
          format-full = "";
          format-icons = [ "" "" "" "" "" ];
        };

        "battery#bat2" = {
          bat = "BAT1";
          adapter = "AC";
          interval = 10;
          states = {
              full = 100;
              good = 99;
              empty = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-full = " 100%";
          format-icons = [ "" "" "" "" "" ];
        };

        "network#disconnected" = {
          tooltip-format = "No connection!";
          format-ethernet = "";
          format-wifi = "";
          format-linked = "";
          format-disconnected = "";
          on-click = "nm-connection-editor";
        };

        "network#ethernet" = {
          interface = "enp*";
          format-ethernet = "";
          format-wifi = "";
          format-linked = "";
          format-disconnected = "";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        "network#wifi" = {
          interface = "wlp*";
          format-ethernet = "";
          format-wifi = " {essid} ({signalStrength}%)";
          format-linked = "";
          format-disconnected = "";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        "network#vpn" = {
          interface = "tun0";
          format = "";
          format-disconnected = "";
          tooltip-format = "{ifname}: {ipaddr}/{cidr}";
          on-click = "nm-connection-editor";
        };

        "pulseaudio" = {
          scroll-step = 1;
          format = "{icon} {volume}%{format_source}";
          format-bluetooth = "{icon} {volume}%{format_source}";
          format-bluetooth-muted = " {icon}{format_source}";
          format-muted = " {format_source}";
          format-source = "  {volume}%";
          format-source-muted = " ";
          format-icons = {
            headphone = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "" ];
          };
          on-click = "pavucontrol";
        };

        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tooltip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };

        "tray" = {
          icon-size = 13;
          spacing = 10;
        };

        "wlr/taskbar" = {
          format = "{icon}";
          icon-size = 30;
          tooltip = false;
        };

        "hyprland/workspaces" = {
          #disable-scroll = true;
          all-outputs = true;
          persistent-workspaces = {
            "*" = 6;
          };
          #warp-on-scroll = false;
          format = "{icon}";
          format-icons = {
            active = "<b></b>";
            persistent = "";
            empty = "";
          };
          sort-by-number = true;
        };

      };

    };

    # macchiato-rosewater: #f4dbd6;
    # macchiato-flamingo: #f0c6c6;
    # macchiato-pink: #f5bde6;
    # macchiato-mauve: #c6a0f6;
    # macchiato-red: #ed8796;
    # macchiato-maroon: #ee99a0;
    # macchiato-peach: #f5a97f;
    # macchiato-yellow: #eed49f;
    # macchiato-green: #a6da95;
    # macchiato-teal: #8bd5ca;
    # macchiato-sky: #91d7e3;
    # macchiato-sapphire: #7dc4e4;
    # macchiato-blue: #8aadf4;
    # macchiato-lavender: #b7bdf8;
    # macchiato-text: #cad3f5;
    # macchiato-subtext1: #b8c0e0;
    # macchiato-subtext0: #a5adcb;
    # macchiato-overlay2: #939ab7;
    # macchiato-overlay1: #8087a2;
    # macchiato-overlay0: #6e738d;
    # macchiato-surface2: #5b6078;
    # macchiato-surface1: #494d64;
    # macchiato-surface0: #363a4f;
    # macchiato-base: #24273a;
    # macchiato-mantle: #1e2030;
    # macchiato-crust: #181926;

    style = ''
@define-color macchiato-rosewater #f4dbd6;
@define-color macchiato-flamingo #f0c6c6;
@define-color macchiato-pink #f5bde6;
@define-color macchiato-mauve #c6a0f6;
@define-color macchiato-red #ed8796;
@define-color macchiato-maroon #ee99a0;
@define-color macchiato-peach #f5a97f;
@define-color macchiato-yellow #eed49f;
@define-color macchiato-green #a6da95;
@define-color macchiato-teal #8bd5ca;
@define-color macchiato-sky #91d7e3;
@define-color macchiato-sapphire #7dc4e4;
@define-color macchiato-blue #8aadf4;
@define-color macchiato-lavender #b7bdf8;
@define-color macchiato-text #cad3f5;
@define-color macchiato-subtext1 #b8c0e0;
@define-color macchiato-subtext0 #a5adcb;
@define-color macchiato-overlay2 #939ab7;
@define-color macchiato-overlay1 #8087a2;
@define-color macchiato-overlay0 #6e738d;
@define-color macchiato-surface2 #5b6078;
@define-color macchiato-surface1 #494d64;
@define-color macchiato-surface0 #363a4f;
@define-color macchiato-base #24273a;
@define-color macchiato-mantle #1e2030;
@define-color macchiato-crust #181926;

* {
    border: none;
    border-radius: 20px;
    font-family: UbuntuSansMono Nerd Font Mono;
    font-size: 16pt;
}

window#waybar {
    background-color: transparent;
    transition-property: background-color;
    transition-duration: .2s;
}

#workspaces {
    background-color: @macchiato-base;
    background: @macchiato-base;
    padding: 0 0 0 0;
    margin: 0 0 5px 20px;
}

#workspaces button {
    background-color: transparent;
    padding: 0.5em;
    color: @macchiato-rosewater;
    background: @macchiato-base;
}

#workspaces button:hover {
    background-color: @macchiato-surface2;
}

#workspaces button.empty {
    color: @macchiato-overlay2;
}

#workspaces button.active {
    color: @macchiato-red;
}

#mode {
    background-color: @macchiato-base;
}

#backlight,
#battery.bat1,
#battery.bat2,
#clock,
#cpu,
#custom-mail,
#custom-poweroff,
#custom-weather,
#memory,
#mode,
#network.vpn,
#network.wifi,
#network.ethernet,
#network.disconnected,
#pulseaudio,
#temperature,
#tray {
    background-color: #24273a;
    padding: 0 10px 0 10px;
    margin: 0 1px 5px 1px;
}


#taskbar {
    background-color: transparent;
    padding: 0 0 0 0;
    margin: 0 0 5px 0;
}

#battery.bat1,
#battery.bat2 {
    color: @macchiato-green;
}

#memory {
    color: @macchiato-lavender;
}

#cpu {
    color: @macchiato-blue;
}

#temperature {
    color: @macchiato-yellow;
}

#temperature.critical {
    color: @macchiato-red;
}

#pulseaudio {
    color: @macchiato-teal;
}

#network.vpn,
#network.wifi,
#network.ethernet,
#network.disconnected {
    color: @macchiato-sapphire;
}

#clock {
    color: @macchiato-rosewater;
}

#battery.bat2.critical:not(.charging) {
    background-color: @macchiato-base;
    color: @macchiato-red;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#taskbar button {
    background-color: @macchiato-base;
}

#taskbar button.active {
    background-color: @macchiato-surface1;
}

#taskbar button:hover {
    background-color: @macchiato-surface2;
}
    '';
  };
}
