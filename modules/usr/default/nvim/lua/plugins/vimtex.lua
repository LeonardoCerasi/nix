vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',
    '-interaction=nonstopmode',
    '-shell-escape',
    '-pdf',
    '-pdflatex=lualatex',
  },
}

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_complete_enabled = true
