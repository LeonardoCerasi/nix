{ pkgs, config, ... }:

{
  environment.systemPackages = with pkgs; [
    cudatoolkit
  ];
  
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      nvidiaBusId = "PCI:11:0:0";
    };
  };

  nixpkgs.config.cudaSupport = true;
}
