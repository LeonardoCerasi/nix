{ pkgs, ... }:

{
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  #  programs.zsh = {
  #    enable = true;

  #    oh-my-zsh = {
  #      enable = true;
  #      custom = "./oh-my-zsh";
  #      plugins = [ "git" "fast-syntax-highlighting" ];
  #      theme = "personal";
  #    };
  #  };
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      custom = ./oh-my-zsh;
      theme = "personal";
      plugins = [
        "git"
        "npm"
        "history"
        "node"
        "rust"
        "deno"
      ];
    };
  };

  #home.file.".zshrc".source = ./.zshrc;
  #home.file.".zshenv".source = ./.zshenv;
}
