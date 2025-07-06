require('neo-tree').setup {
  default_component_configs = {
    file_size = {
      enabled = false,
    },
    type = {
      enabled = false,
    },
    last_modified = {
      enabled = false,
    },
    created = {
      enabled = false,
    },
    symlink_target = {
      enabled = false,
    },
  },

  window = {
    -- Override NeoTree's window settings
    position = "left",
    --width = 30,
    -- This disables line numbers in the tree
    options = {
      number = false,
      relativenumber = false,
      signcolumn = "no", -- Optional: hides the sign column too
    }
  },

}
