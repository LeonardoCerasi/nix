{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #oh-my-zsh
    eza
  ];

  # custom zsh
  home.file.".zsh-custom".source = ./.zsh-custom;
  home.file.".zsh-custom".recursive = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # eza aliases
      ll = "eza -1laghT --classify --icons --level=1 --time-style '+%d-%m-%Y %H:%M:%S'";
      lsize = "eza -1laghT --classify --icons --level=1 --time-style '+%d-%m-%Y %H:%M:%S' --total-size";
      lgit = "eza -1laghT --classify --icons --level=2 --time-style '+%d-%m-%Y %H:%M:%S' --git --git-repos --git-ignore --ignore-glob=images";

      # nix aliases
      nixc = "cd $HOME/nix && lgit";

      # ls aliases
      la = "ls -A";
      l = "ls -CF";

      # other aliases
      q = "exit";
      shut = "shutdown now";
      n = "nvim";

      # customization-neede aliases
      clear = "unset NEW_LINE_BEFORE_PROMPT && clear";
      reset = "unset NEW_LINE_BEFORE_PROMPT && reset";
    };

    # custom zsh
    initContent = ''
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
