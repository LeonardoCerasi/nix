{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
  ];

  # gpg
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
