{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";
  fullname = "Leonardo Cerasi";
  hostname = "desktop";
in
{
  imports =
    [
      ../default.nix

      # <--- HARDWARE --->
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
      ./hardware/audio.nix
      ./hardware/keyboard.nix

      # <--- SOFTWARE --->
      ./software/bootloader.nix
      ./software/dev.nix
      ./software/locale.nix
      ./software/network.nix
      # ./software/virtualization.nix

      # <--- MODULES --->
      ../../modules/wm/gnome/x11.nix
      ../../modules/gnupg.nix
    ];

  # user account
  users.users.${usrname} = {
    isNormalUser = true;
    home = homefld;
    description = fullname;
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };

  # system settings
  networking.hostName = hostname;

  # <--- packages --->

  environment.systemPackages = with pkgs; [
    appimage-run
  ];

}
