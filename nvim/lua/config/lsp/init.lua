vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(ev)
    require("config.lsp.keymaps")(ev)
    require("config.lsp.highlight")(ev)
  end
})

require 'config.lsp.servers.lua-ls'
require 'config.lsp.servers.gopls'
require 'config.lsp.servers.bash-language-server'

