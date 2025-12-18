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
