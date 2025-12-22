require('nvim-web-devicons').setup()

require("which-key").setup({
  delay = 500,  -- Delay before showing popup (ms)
  icons = {
    mappings = true,
    keys = {},
  },
})

-- Optional: Register your leader key groups for better labels
local wk = require("which-key")
wk.add({
  { "<leader>g", group = "Git" },
  { "<leader>h", group = "Hunk" },
  { "<leader>t", group = "Terminal" },
})
