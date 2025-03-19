{ pkgs, ... }:

{
  # required packages
  home.packages = with pkgs; [
    unzip
    ripgrep
    bc
    fd
    xclip
    lua5_1
    luarocks

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
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

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
  };

  home.file.".config/nvim/init.lua".source = ./init.lua;
  home.file.".config/nvim/lua".source = ./lua;
  home.file.".config/nvim/lua".recursive = true;
}
