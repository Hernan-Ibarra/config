local notify = require 'notify'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'acceleratorscript',
  callback = function()
    local path = '/Users/hernan.ibarramejia87/code/accelerator-lsp'
    local command = { 'npm', 'run', '--silent', '--prefix', path, 'start' }

    local server = vim.lsp.start { name = 'accelerator-lsp', cmd = command }

    if not server then
      notify('Could not connect to accelerator language server.', 'error', {
        title = 'accelerator-lsp',
      })
      return
    end

    vim.lsp.buf_attach_client(0, server)
    notify('Accelerator language server found.', 'info', {
      title = 'accelerator-lsp',
    })
  end,
})
