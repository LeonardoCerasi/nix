{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
    ];

  # Bootloader.
  boot.loader = {
    systemd-boot.enable = false;

    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };

    grub = {
      enable = true;
      device = "nodev";
      useOSProber = true;
      efiSupport = true;
    };
  };

  networking.hostName = "desktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Rome";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "it";
  };

  # Configure console keymap
  console.keyMap = "it2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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

  # gnome
  environment.gnome.excludePackages = with pkgs; [
    baobab      # disk usage analyzer
    cheese      # photo booth
    eog         # image viewer
    epiphany    # web browser
    #gedit       # text editor
    simple-scan # document scanner
    totem       # video player
    yelp        # help viewer
    evince      # document viewer
    file-roller # archive manager
    geary       # email client
    seahorse    # password manager
    snapshot    # camera

    #gnome-calculator
    gnome-calendar gnome-characters gnome-clocks gnome-contacts
    gnome-font-viewer gnome-logs gnome-maps gnome-music gnome-screenshot
    gnome-system-monitor gnome-weather gnome-disk-utility gnome-connections
    gnome-tour
    gnome-console
  ];

  services.xserver.excludePackages = [ pkgs.xterm ]; 

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

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
