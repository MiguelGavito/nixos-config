local install_dir = vim.fn.stdpath('data') .. '/treesitter-parsers'

require('nvim-treesitter.configs').setup {
    parser_install_dir = install_dir,
    ensure_installed = { 'lua', 'nix', 'c', 'cpp' },

    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },
}
