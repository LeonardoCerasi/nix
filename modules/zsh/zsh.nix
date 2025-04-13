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
      q = "exit";
      shut = "shutdown now";
      n = "nvim";
    };

    # custom zsh
    initExtra = ''
      # custom prompt
      source $HOME/.zsh-custom/themes/personal.zsh-theme

      # custom .zcompdump location
      export ZSH_COMPDUMP=$HOME/.cache/.zcompdump-$HOST

      # custom aliases
      source $HOME/.zsh-custom/aliases/.git_alias
      source $HOME/.zsh-custom/aliases/.notes_alias
      if [ -f "$HOME/.local_alias" ]; then
        source "$HOME/.local_alias"
      fi
    '';

    # custom zsh env
    envExtra = ''
      if [[ -d "$HOME/bin" ]]; then
        PATH="$HOME/bin:$PATH"
      fi
    '';
  };
}
