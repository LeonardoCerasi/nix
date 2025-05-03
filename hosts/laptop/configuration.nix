{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";
  fullname = "Leonardo Cerasi";
  hostname = "laptop";
in
{
  imports =
    [
      ../default.nix

      # <--- HARDWARE --->
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
      ./hardware/audio.nix

      # <--- SOFTWARE --->
      ./software/bootloader.nix
      ./software/dev.nix
      ./software/locale.nix
      ./software/network.nix
    ];

  # user account
  users.users.${usrname} = {
    isNormalUser = true;
    home = homefld;
    description = fullname;
    extraGroups = [ "networkmanager" "wheel" ];

    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMBTuhI76/d8w5BN4tX2UhDhaM2p3yVGl2SARW9foqIj"
      ];
    };
  };

  # system settings
  networking.hostName = hostname;

  # <--- packages --->

  environment.systemPackages = with pkgs; [
    material-design-icons
  ];

  # <--- services --->

  services = {

    greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "Hyprland";
          user = usrname;
        };
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet -cmd Hyprland";
          user = "greeter";
        };
      };
    };

  };
}
