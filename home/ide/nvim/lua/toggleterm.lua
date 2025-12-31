require("toggleterm").setup({
  size = 20,
  open_mapping = [[<c-\>]],  -- works in normal + terminal mode
  direction = 'float',
  float_opts = { border = 'curved' },
})

-- Leader mappings: normal mode only (won't trigger while typing in terminal)
vim.keymap.set('n', '<leader>t1', '<Cmd>1ToggleTerm direction=float<CR> size=12<CR>',       { desc = 'Terminal 1 (horizontal)' })
vim.keymap.set('n', '<leader>t2', '<Cmd>2ToggleTerm direction=horizontal size=12<CR>',      { desc = 'Terminal 2 (horizontal)' })
vim.keymap.set('n', '<leader>t3', '<Cmd>3ToggleTerm direction=vertical size=40<CR>',       { desc = 'Terminal 3 (vertical)' })
vim.keymap.set('n', '<leader>t4', '<Cmd>4ToggleTerm direction=float<CR>',                  { desc = 'Terminal 4 (float)' })
vim.keymap.set('n', '<leader>tc', '<Cmd>ToggleTermToggleAll<CR>',                          { desc = 'Close all terminals' })

-- Terminal mapping: terminal mode only (movement on terminals)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]],                                            { desc = 'Escape' } )
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]],                                     { desc = 'izq' }    )
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]],                                     { desc = 'abajo' }  )
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]],                                     { desc = 'arriba' } )
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]],                                     { desc = 'derecha' }    )
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]],                                       { desc = 'window ' })
