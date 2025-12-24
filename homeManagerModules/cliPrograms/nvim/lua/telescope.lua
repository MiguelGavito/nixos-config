require('telescope').setup({
	extensions = {
    	fzf = {
      	fuzzy = true,                    -- false will only do exact matching
      	override_generic_sorter = true,  -- override the generic sorter
      	override_file_sorter = true,     -- override the file sorter
      	case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    	}
  	}
})

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
-- command for search files short nvim
vim.api.nvim_create_user_command('Te', function()
  builtin.find_files()
end, {})

-- Search Files   
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })

-- Search text on project      
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find text (grep)' })

-- Search on actual buffer
vim.keymap.set('n', '<leader>fb', builtin.current_buffer_fuzzy_find, { desc = 'Find in buffer' })

-- Search buffers
vim.keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find buffers' })

-- Search help 
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help' })

-- Search commands
vim.keymap.set('n', '<leader>fc', builtin.command_history, { desc = 'Command history' })
