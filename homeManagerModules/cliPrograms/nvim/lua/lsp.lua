local on_attach = function(_, bufnr)

  local bufmap = function(keys, func)
    vim.keymap.set('n', keys, func, { buffer = bufnr })
  end

  bufmap('<leader>r', vim.lsp.buf.rename)
  bufmap('<leader>a', vim.lsp.buf.code_action)

  bufmap('gd', vim.lsp.buf.definition)
  bufmap('gD', vim.lsp.buf.declaration)
  bufmap('gI', vim.lsp.buf.implementation)
  bufmap('<leader>D', vim.lsp.buf.type_definition)

  bufmap('gr', require('telescope.builtin').lsp_references)
  bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
  bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

  bufmap('K', vim.lsp.buf.hover)

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

-- Auto-start LSP
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'lua', 'nix' },
    callback = function(args)
        vim.lsp.enable({ 'lua_ls', 'nil_ls' })
        on_attach(nil, args.buf)
    end,
})
