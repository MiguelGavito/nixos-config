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

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('neodev').setup()

local lspconfig = require('lspconfig')

-- Lua LSP
lspconfig.lua_ls.setup({
  cmd = { 'lua-language-server' },
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Nix LSP
lspconfig.nil_ls.setup({
  cmd = { 'nil' },
  capabilities = capabilities,
})

-- latter add other LSP, python, cpp, maybe rust, React, Typescript

-- C/C++ LSP (clangd)
lspconfig.clangd.setup({
  cmd = { 'clangd' },
  capabilities = capabilities,
})

-- Attach buffer keymaps on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    on_attach(nil, args.buf)
  end,
})
