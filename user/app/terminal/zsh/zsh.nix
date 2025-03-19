{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh.oh-my-zsh = {
    enable = true;
    custom = "./.oh-my-zsh";
  };

  home.file.".zshrc".source = ./.zshrc;
  home.file.".zshenv".source = ./.zshenv;
}
