local on_attach = function(_, bufnr)
  local bufmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  bufmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  bufmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  bufmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  bufmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  bufmap('gI', vim.lsp.buf.implementation, 'Goto Implementation')
  bufmap('<leader>D', vim.lsp.buf.type_definition, 'Type Definition')

  bufmap('gr', require('telescope.builtin').lsp_references, 'Goto References')
  bufmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')
  bufmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

  bufmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  bufmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Help')

  bufmap('<leader>f', function()
    vim.lsp.buf.format({ async = true })
  end, 'Format')

  -- Diagnostic keymaps
  bufmap('[d', vim.diagnostic.goto_prev, 'Previous Diagnostic')
  bufmap(']d', vim.diagnostic.goto_next, 'Next Diagnostic')
  bufmap('<leader>e', vim.diagnostic.open_float, 'Show Diagnostic')
  bufmap('<leader>q', vim.diagnostic.setloclist, 'Diagnostic List')
end

-- Configuración de diagnósticos
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

-- Símbolos de diagnóstico
local signs = { Error = "✘", Warn = "▲", Hint = "⚑", Info = "»" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Lua Language Server
require('neodev').setup()
require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  cmd = { "lua-language-server" },
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  }
}

-- Nix Language Servers
require('lspconfig').nil_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      },
    },
  },
}

-- También puedes usar nixd (comentado por defecto, descomenta si prefieres nixd sobre nil_ls)
-- require('lspconfig').nixd.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- Python Language Server
require('lspconfig').pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- TypeScript/JavaScript Language Server
require('lspconfig').ts_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Bash Language Server
require('lspconfig').bashls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}
