vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'plugins.nvim-treesitter'

require 'plugins.catppuccin'
require 'plugins.nvim-tree'
require 'plugins.gitsigns'
require 'plugins.lualine'
require 'plugins.todo-comments'
require 'plugins.which-key'

require 'plugins.nvim-cmp'
require 'plugins.lsp'

require 'plugins.telescope'

require 'plugins.vimtex'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.health'

require 'snippets.snippets'
