{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };

    oh-my-zsh = {
      enable = true;
      custom = "~/.oh-my-zsh";
      theme = "personal";
      plugins = [
        "git"
        "fast-syntax-highlighting"
      ];
    };
  };

  #home.file.".zshrc".source = ./.zshrc;
  #home.file.".zshenv".source = ./.zshenv;
  home.file.".oh-my-zsh".source = ./.oh-my-zsh;
  home.file.".oh-my-zsh".recursive = true;
}
