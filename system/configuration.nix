{ pkgs, ... }:

{
  imports =
    [
      # HARDWARE
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
      ./hardware/audio.nix

      # SOFTWARE
      ./software/bootloader.nix
      ./software/locale.nix
      ./software/window-manager/x11.nix
    ];

  networking.hostName = "desktop";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Configure console keymap
  console.keyMap = "it2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leonardo = {
    isNormalUser = true;
    description = "Leonardo Cerasi";
    extraGroups = [ "networkmanager" "wheel" "openrazer" ];
    packages = with pkgs; [
      thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    git-credential-manager
    stow
    gcc
    clang
    rustup
    gnupg
    pass
    lshw
    telegram-desktop
    signal-desktop
    pinentry
    pinentry-curses
    nautilus
    os-prober
    spotify
    gnomeExtensions.appindicator
    proton-pass
    gnome-keyring
    gnumake
    cmake
    unzip
    ripgrep
    home-manager
    python3
    bc
    lua5_1
    luarocks
    pinentry-gnome3
    kitty
    nodejs
    fd
    xclip
    jdk
    neofetch
    lolcat
    cowsay
    fortune
    openrazer-daemon
    polychromatic
    libnotify
    vivaldi
  ];

  environment.variables = {
    EDITOR = "nvim";
    _JAVA_OPTIONS= "-Dawt.useSystemAAFontSettings=lcd";
  };

  # neovim
  programs.neovim = {
    enable = true;
    defaultEditor = true;

  };

  # zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # gpg
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # openrazer
  hardware.openrazer.enable = true;

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
}
