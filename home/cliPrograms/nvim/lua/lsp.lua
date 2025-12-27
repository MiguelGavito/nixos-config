local on_attach = function(_, bufnr)

  local bufmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  bufmap('<leader>r', vim.lsp.buf.rename, 'Rename symbol')
  bufmap('<leader>a', vim.lsp.buf.code_action, 'Code action')

  bufmap('gd', vim.lsp.buf.definition, 'Go to definition')
  bufmap('gD', vim.lsp.buf.declaration, 'Go to declaration')
  bufmap('gI', vim.lsp.buf.implementation, 'Go to implementation')
  bufmap('<leader>D', vim.lsp.buf.type_definition, 'Got to type definition')

  bufmap('gr', require('telescope.builtin').lsp_references, 'Go to references')
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols, 'Document symbols')
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace symbols')

  bufmap('K', vim.lsp.buf.hover, 'Hover info')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require('neodev').setup()

-- Lua LSP
vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
})

-- Nix LSP
vim.lsp.config('nil_ls', {
    cmd = { 'nil' },
    root_markers = { 'flake.nix', '.git' },
    filetypes = { 'nix' },
})

-- latter add other LSP, python, cpp, maybe rust, React, Typescript

-- C++ LSP (clangd)
vim.lsp.config('clangd', {
    cmd = { 'clangd' },
    root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
    filetypes = { 'c', 'cpp', 'cc', 'cxx', 'h', 'hpp' },
    capabilities = capabilities,
})

-- Auto-start LSP
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'nix', 'c', 'cpp', 'cc', 'cxx', 'h', 'hpp' },
    callback = function(args)
    vim.lsp.enable({ 'lua_ls', 'nil_ls', 'clangd' })
        on_attach(nil, args.buf)
    end,
})
