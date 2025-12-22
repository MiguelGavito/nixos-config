require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],
  direction = 'float',  -- 'vertical' | 'horizontal' | 'tab' | 'float'
  float_opts = {
    border = 'curved',
  },
})

-- Keybindings for specific terminals
vim.keymap.set('n', '<leader>tt', ':ToggleTerm<CR>', { desc = 'Toggle terminal' })
vim.keymap.set('n', '<leader>tf', ':ToggleTerm direction=float<CR>', { desc = 'Float terminal' })
vim.keymap.set('n', '<leader>th', ':ToggleTerm direction=horizontal<CR>', { desc = 'Horizontal terminal' })
vim.keymap.set('n', '<leader>tv', ':ToggleTerm direction=vertical<CR>', { desc = 'Vertical terminal' })
