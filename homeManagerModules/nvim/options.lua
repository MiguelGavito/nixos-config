-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General settings
vim.o.clipboard = 'unnamedplus'
vim.o.mouse = 'a'
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- UI
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.wrap = false

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Split windows
vim.o.splitbelow = true
vim.o.splitright = true

-- File settings
vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true

-- Filetype
vim.cmd("filetype plugin indent on")
