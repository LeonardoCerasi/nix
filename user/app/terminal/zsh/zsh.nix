{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #oh-my-zsh
  ];

  # custom zsh
  home.file.".zsh-custom".source = ./.zsh-custom;
  home.file.".zsh-custom".recursive = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };

    # custom zsh
    initExtra = ''
      source ~/.zsh-custom/themes/personal.zsh-theme
    '';
  };
}
