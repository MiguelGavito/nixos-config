require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],  -- works in normal + terminal mode
  direction = 'float',
  float_opts = { border = 'curved' },
})

-- Leader mappings: normal mode only (won't trigger while typing in terminal)
vim.keymap.set('n', '<leader>t1', '<Cmd>1ToggleTerm direction=float<CR>',                   { desc = 'Terminal 1 (float)' })
vim.keymap.set('n', '<leader>t2', '<Cmd>2ToggleTerm direction=horizontal size=12<CR>',     { desc = 'Terminal 2 (horizontal)' })
vim.keymap.set('n', '<leader>t3', '<Cmd>3ToggleTerm direction=vertical size=40<CR>',       { desc = 'Terminal 3 (vertical)' })
vim.keymap.set('n', '<leader>t4', '<Cmd>4ToggleTerm direction=float<CR>',                  { desc = 'Terminal 4 (float)' })
vim.keymap.set('n', '<leader>tc', '<Cmd>ToggleTermToggleAll<CR>',                          { desc = 'Close all terminals' })
