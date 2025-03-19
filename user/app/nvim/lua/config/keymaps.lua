-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
--
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<S-j>', '10j', { desc = 'Scroll 10 lines downward' })
vim.keymap.set('n', '<S-k>', '10k', { desc = 'Scroll 10 lines upward' })
vim.keymap.set('n', '<S-h>', '10h', { desc = 'Move 10 characters on the left' })
vim.keymap.set('n', '<S-l>', '10l', { desc = 'Move 10 characters on the right' })

vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'file save' })
vim.keymap.set('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'file copy whole' })

-- tabufline
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', { desc = 'New [B]uffer' })

-- TODO: Set up nchad.tabufline

--[
-- vim.keymap.set('n', '<tab>', function()
--   require('nvchad.tabufline').next()
-- end, { desc = 'buffer goto next' })
--
-- vim.keymap.set('n', '<S-tab>', function()
--   require('nvchad.tabufline').prev()
-- end, { desc = 'buffer goto prev' })

-- vim.keymap.set('n', '<leader>x', function()
--   require('nvchad.tabufline').close_buffer()
-- end, { desc = 'buffer close' })
--]

-- NOTE: nvim-tree

-- Toggle side file menu
vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = 'nvimtree toggle window' })

-- NOTE: todo-comments

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next [T]odo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous [T]odo comment" })

vim.keymap.set('n', '<leader>t', '<cmd>TodoLocList<CR>', { desc = "Show all [T]odo comments in project" })

-- NOTE: custom

vim.keymap.set('i', '<C-j>', '<cmd>lua require"luasnip".jump(1)<CR>')
vim.keymap.set('i', '<C-k>', '<cmd>lua require"luasnip".jump(-1)<CR>')
