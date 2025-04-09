{ pkgs, ... }:

{
  imports =
    [
      # <--- HARDWARE --->
      ./hardware/hardware-configuration.nix
      ./hardware/audio.nix

      # <--- SOFTWARE --->
      ./software/bootloader.nix
      ./software/dev.nix
      ./software/fonts.nix
      ./software/locale.nix
      ./software/network.nix
      ./software/window-manager/hyprland.nix
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
  networking.hostName = "laptop";
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
    pass # needed for git-credential-manager
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
