{ pkgs, ... }:

let
  usrname = "leonardo";
  homefld = "/home/leonardo";
  fullname = "Leonardo Cerasi";
  nixver = "24.11";
  hostname = "laptop";
  timezone = "Europe/Rome";
  keymap = "it2";
in
{
  imports =
    [
      # <--- HARDWARE --->
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
      ./hardware/audio.nix

      # <--- SOFTWARE --->
      ./software/bootloader.nix
      ./software/dev.nix
      ./software/locale.nix
      ./software/network.nix
      ./software/window-manager/hyprland.nix
      ./software/app/gnupg.nix
    ];

  # user account
  users.users.${usrname} = {
    isNormalUser = true;
    home = homefld;
    description = fullname;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # nix version
  system.stateVersion = nixver;

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
  networking.hostName = hostname;
  time.timeZone = timezone;
  console.keyMap = keymap;

  # CUPS
  services.printing.enable = true;

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
    material-design-icons
    cryptsetup # LUKS for dm-crypt
    keypassxc

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
