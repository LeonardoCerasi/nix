require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    disable = { 'latex' },
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
}
