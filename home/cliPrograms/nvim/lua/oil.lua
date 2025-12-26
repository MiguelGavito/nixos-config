require("oil").setup({
  view_options = {
    show_hidden = true,  -- Show dotfiles
  },
  keymaps = {
    ["<C-h>"] = "actions.select_split",  -- Open in horizontal split
    ["<C-v>"] = "actions.select_vsplit", -- Open in vertical split
  },
})

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { desc = "Open Oil file explorer" })
