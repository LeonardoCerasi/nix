return {
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = "auto",
      section_separators = '',
      component_separators = '|',
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
  }
}
