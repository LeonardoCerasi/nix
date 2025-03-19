{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnupg
    pass
    pinentry
    pinentry-curses
    pinentry-gnome3
  ];

  # gpg
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
