{ pkgs, ... }:

{
  imports =
    [
      # <--- HARDWARE --->
      ./hardware/hardware-configuration.nix
      ./hardware/nvidia.nix
      ./hardware/audio.nix

      # <--- SOFTWARE --->
      ./software/bootloader.nix
      ./software/locale.nix
      ./software/network.nix
      ./software/window-manager/x11.nix
    ];

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

  # Install firefox.
  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
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
    proton-pass
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
    libnotify
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
