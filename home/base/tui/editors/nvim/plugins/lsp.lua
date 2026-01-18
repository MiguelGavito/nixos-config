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

-- Lua LSP (native API)
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  capabilities = capabilities,
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
})

-- Nix LSP (native API)
vim.lsp.config('nil_ls', {
  cmd = { 'nil' },
  filetypes = { 'nix' },
  capabilities = capabilities,
})

-- C/C++ LSP (clangd, native API)
vim.lsp.config('clangd', {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'cc', 'cxx', 'h', 'hpp' },
  capabilities = capabilities,
})

-- Auto-start LSP on filetype and attach mappings
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'nix', 'c', 'cpp', 'cc', 'cxx', 'h', 'hpp' },
  callback = function(args)
    vim.lsp.enable({ 'lua_ls', 'nil_ls', 'clangd' })
    on_attach(nil, args.buf)
  end,
})
