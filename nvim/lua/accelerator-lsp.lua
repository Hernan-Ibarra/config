local command = 'npm run --silent --prefix /Users/hernan.ibarramejia87/code/accelerator-lsp start'

local client = vim.lsp.start_client {
  name = 'accelerator-lsp',
  cmd = { command },
}

if not client then
  vim.notify 'there is a problem connecting to the language server'
  return
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.accelerator' },
  callback = function()
    vim.lsp.buf_attach_client(0, client)
    print 'accelerator-lsp connected!'
  end,
})
