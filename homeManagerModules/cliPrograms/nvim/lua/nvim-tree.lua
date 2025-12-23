require("nvim-tree").setup({
  view = {
    side = "left",
    width = 30,
  },
  renderer = {
    icons = {
      show = {
        git = true,
        folder = true,
        file = true,
      },
    },
  },
  filters = {
    dotfiles = false,  -- Show hidden files
  },
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
  
    -- l expands folder
    vim.keymap.set('n', 'l', api.node.open.edit, { buffer = bufnr, desc = 'Expand folder' })
  
    -- Enter (CR) enters/changes root to folder
    vim.keymap.set('n', 'n', api.tree.change_root_to_node, { buffer = bufnr, desc = 'Enter folder' })
  
    -- h exits/collapses
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, { buffer = bufnr, desc = 'Exit folder' })
  end
})

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle file tree' })
vim.keymap.set('n', '<leader>o', ':NvimTreeFocus<CR>', { desc = 'Focus file tree' })
