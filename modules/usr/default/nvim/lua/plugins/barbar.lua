require('barbar').setup {
  -- Enable/disable animations
  animation = true,

  -- Automatically hide the tabline when there are this many buffers left.
  -- Set to any value >=0 to enable.
  auto_hide = false,
  tabpages = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
  -- Valid options are 'left' (the default), 'previous', and 'right'
  focus_on_close = 'left',

  -- Set the filetypes which barbar will offset itself for
  sidebar_filetypes = {
    -- Offset Barbar when Neo-Tree is open
    ["neo-tree"] = { event = "BufWipeout", text = "neo-tree", align = "right" },
  },
}
