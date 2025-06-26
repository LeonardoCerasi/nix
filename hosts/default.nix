{ pkgs, nix-version, ... }:

let
  timezone = "Europe/Rome";
  keymap = "it2";
in
{
  imports =
    [
      # <--- MODULES --->
      ../modules/wm/hypr/hyprland.nix
      ../modules/gnupg.nix
    ];

   # nix version
  system.stateVersion = nix-version;

  # enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # automatic updates
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  # automatic garbage cleanup
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 10d";
  };
  nix.settings.auto-optimise-store = true;

  # system settings
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
    cryptsetup # LUKS for dm-crypt
    keepassxc
    lm_sensors

    home-manager
  ];

  environment.variables = {
    _JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
    NIX_VERSION = "${nix-version}";
  };

  # remove ssh-askpass popup for git
  environment.extraInit = ''
    unset -v SSH_ASKPASS
  '';

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
