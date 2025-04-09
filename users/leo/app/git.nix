{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git-credential-manager
  ];

  programs.git = {
    enable = true;

    userName = "LeonardoCerasi";
    userEmail = "leo.cerasi@pm.me";
    signing = {
      key = "86814D218FAD9435";
      signByDefault = true;
    };

    extraConfig = {
      credential.helper = "manager";
      credential.credentialStore = "gpg";
    };
  };
}
