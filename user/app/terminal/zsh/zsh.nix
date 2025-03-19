{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      #custom = "./.oh-my-zsh";
      plugins = [ "git" "fast-syntax-highlighting" ];
      theme = "robbyrussel";
    };
  };

  home.file.".zshrc".source = ./.zshrc;
  home.file.".zshenv".source = ./.zshenv;
}
