{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pciutils
  ];

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking = {
    networkmanager.enable = true;

    interfaces.enp3s0 = {
      ipv4.addresses = [{
        address = "10.0.0.2";
        prefixLength = 24;
      }];
    };
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      UseDns = true;
      X11Forwarding = false;
    };
  };
}
