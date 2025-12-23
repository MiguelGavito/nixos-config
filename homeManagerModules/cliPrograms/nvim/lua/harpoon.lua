local harpoon = require("harpoon")
harpoon:setup()

-- Add current file to harpoon marks
vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end, { desc = "Harpoon add file" })

-- Toggle harpoon menu
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

-- Navigate to marks 1-4 (numeric keys instead of hjkl)
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
