{ config, pkgs, ... }:

{
  home.username = "leonardo";
  home.homeDirectory = "/home/leonardo/";

  home. stateVersion = "24.11";
  programs.home-manager.enable = true;

  nixpkgs.config.allowUnfree = true;

  # programs

  home.packages = with pkgs; [
    firefox
    vivaldi
    thunderbird
    texlive.combined.scheme-full
    zathura
    xdotool # for zathura in neovim
    pstree # for zathura in neovim
    qbittorrent
    libreoffice-qt
    hunspell
    hunspellDicts.it_IT
    hunspellDicts.en_US
    hunspellDicts.fr-any
    hunspellDicts.de_DE
    insync
    insync-nautilus
    notesnook
    obsidian
    filezilla
    discord
    openrazer-daemon
    polychromatic

    telegram-desktop
    signal-desktop
    nautilus
    spotify
    proton-pass

    # LSP
    lua-language-server
    vim-language-server
    pyright
    rust-analyzer
    ltex-ls
    texlab
    lua51Packages.lua-lsp
    ccls
    nil

    # instant-reference tool
    exiftool
    zenity
    xsel
  ];

  programs.neovim = {
    enable = true;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.catppuccin-nvim
      pkgs.vimPlugins.lualine-nvim
      pkgs.vimPlugins.mini-nvim
      pkgs.vimPlugins.nvim-tree-lua
      pkgs.vimPlugins.todo-comments-nvim
      pkgs.vimPlugins.vim-sleuth
      pkgs.vimPlugins.vimtex
      pkgs.vimPlugins.which-key-nvim
      pkgs.vimPlugins.nvim-web-devicons
      pkgs.vimPlugins.gitsigns-nvim

      pkgs.vimPlugins.telescope-nvim
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.telescope-fzf-native-nvim
      pkgs.vimPlugins.telescope-ui-select-nvim

      pkgs.vimPlugins.nvim-lspconfig
      pkgs.vimPlugins.nvim-cmp
      pkgs.vimPlugins.cmp-nvim-lsp
      pkgs.vimPlugins.luasnip
      pkgs.vimPlugins.friendly-snippets
      pkgs.vimPlugins.cmp_luasnip
    ];

    extraConfig = ":luafile ~/.config/nvim/lua/init.lua";
  };
}
