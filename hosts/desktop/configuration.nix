{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";
  fullname = "Leonardo Cerasi";
  hostname = "desktop";

  def_conf = [ ../default.nix ];
  hard_modules = [
    ./hardware/hardware-configuration.nix
    ./hardware/nvidia.nix
    ./hardware/audio.nix
    ./hardware/keyboard.nix
  ];
  soft_modules = [
    ./software/bootloader.nix
    ./software/dev.nix
    ./software/locale.nix
    ./software/network.nix
    # ./software/virtualization.nix
    ./software/print.nix
  ];
  sys_modules = [
    ../../modules/sys/wm/gnome/x11.nix
    ../../modules/sys/ollama.nix
  ];
in
{
  imports = def_conf ++ hard_modules ++ soft_modules ++ sys_modules;

  # user account
  users.users.${usrname} = {
    isNormalUser = true;
    home = homefld;
    description = fullname;
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];

    openssh = {
      authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEppuYtsodZwEomPyNgiXlwIxof+r77vmU1i1Vjv00W5"
      ];
    };
  };

  # system settings
  networking.hostName = hostname;

  # <--- packages --->

  environment.systemPackages = with pkgs; [
    appimage-run
  ];

}
