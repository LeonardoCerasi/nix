{ pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  #services.displayManager.ly.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.appindicator
    gnome-keyring
    gnome-tweaks
  ];

  programs.dconf.profiles.user = {
    databases = [{
      lockAll = true;
      settings ={
        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
        };
      };
    }];
  };

  # excluded packages
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

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];
}
