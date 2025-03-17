return function(ev)
  local map = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
  end

  local telescope = require 'telescope.builtin'

  map('gd', telescope.lsp_definitions, '[G]oto [D]efinition')
  map('gr', telescope.lsp_references, '[G]oto [R]eferences')
  map('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
  map('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
  map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  map('<leader>ff', vim.lsp.buf.format, '[F]ormat [F]ile')

  local client = vim.lsp.get_client_by_id(ev.data.client_id)

  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    map('<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = ev.buf })
    end, '[T]oggle Inlay [H]ints')
  end
end
