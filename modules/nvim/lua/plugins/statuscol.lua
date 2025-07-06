local function lnum_both()
  local lnum = vim.v.lnum
  local relnum = vim.v.lnum == vim.fn.line(".") and 0 or math.abs(vim.v.lnum - vim.fn.line("."))
  return string.format("%3d %2d", lnum, relnum)
end

require('statuscol').setup {
  setopt = true,
  ft_ignore = { "neo-tree", "neo-tree-popup", "neo-tree-panel" },
  segments = {
    {
      sign = {
        namespace = { "gitsigns.*" },
        name = { "gitsigns.*" },
      },
    },
    {
      sign = {
        namespace = { ".*" },
        name = { ".*" },
        auto = true,
      },
    },
    {
      text = { lnum_both, " " },
      condition = { true },
      click = "v:lua.ScLa",
    },
  },
}
