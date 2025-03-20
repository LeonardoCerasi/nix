{ pkgs, ... }:

{
  imports =
    [
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
      ./software/window-manager/x11.nix
      ./software/app/gnupg.nix
    ];

  # nix version
  system.stateVersion = "24.11";

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # automatic garbage cleanup
  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

  # system settings
  networking.hostName = "desktop";
  time.timeZone = "Europe/Rome";
  console.keyMap = "it2";

  # CUPS
  services.printing.enable = true;

  # user account
  users.users.leonardo = {
    isNormalUser = true;
    description = "Leonardo Cerasi";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
  };

  # <--- PACKAGES --->

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    zsh
    vim
    wget
    git
    stow
    lshw # info about hardware
    libnotify # notifications (necessary)

    home-manager
  ];

  environment.variables = {
    _JAVA_OPTIONS= "-Dawt.useSystemAAFontSettings=lcd";
  };

  # remove ssh-askpass popup for git
  environment.extraInit = ''
    unset -v SSH_ASKPASS
  '';

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
