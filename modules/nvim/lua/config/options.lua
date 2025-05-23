-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- You can change these options as you wish!
-- For more options, you can see `:help option-list`

-- Leave terminal cursor unchanged
-- Autocommand to set guicursor option on VimLeave
vim.api.nvim_create_autocmd('VimLeave', {
  pattern = '*',
  callback = function()
    -- Set the guicursor option
    vim.opt.guicursor = 'a:ver29-iCursor-blinkwait300-blinkon200-blinkoff150'
  end,
})

-- Make line numbers (both absolute and relative) default
vim.opt.number = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.statuscolumn = '%s %l %r '

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 500

-- NEED TO MAKE SPLIT VERTICAL, NOT HORIZONTAL
-- Just use :vsp

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
