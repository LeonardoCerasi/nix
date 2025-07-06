vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'plugins.nvim-treesitter'

require 'plugins.catppuccin'
require 'plugins.gitsigns'
require 'plugins.lualine'
require 'plugins.todo-comments'
require 'plugins.which-key'
require 'plugins.statuscol'
require 'plugins.neo-tree'
require 'plugins.barbar'
require 'plugins.transparent'

require 'plugins.nvim-cmp'
require 'plugins.lsp'

require 'plugins.telescope'

require 'plugins.vimtex'

require 'config.options'
require 'config.keymaps'
require 'config.autocmds'
require 'config.health'

require 'snippets.snippets'
