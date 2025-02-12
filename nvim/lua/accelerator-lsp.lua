vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.accelerator' },
  callback = function()
    -- NOTE: Change this to the path to the respository on your machine
    local path = '/Users/hernan.ibarramejia87/code/accelerator-lsp'
    local command = { 'npm', 'run', '--silent', '--prefix', path, 'start' }

    local client = vim.lsp.start { name = 'accelerator-lsp', cmd = command }

    if not client then
      vim.notify 'there is a problem connecting to the accelerator language server'
      return
    end

    vim.lsp.buf_attach_client(0, client)
    print 'accelerator language server connected!'
  end,
})
