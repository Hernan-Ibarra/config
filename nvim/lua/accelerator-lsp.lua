vim.filetype.add {
  extension = {
    accelerator = 'acceleratorscript',
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'acceleratorscript',
  callback = function()
    -- NOTE: Change this to the path to the respository on your machine
    local path = '/Users/hernan.ibarramejia87/code/accelerator-lsp'
    local command = { 'npm', 'run', '--silent', '--prefix', path, 'start' }

    local server = vim.lsp.start { name = 'accelerator-lsp', cmd = command }

    if not server then
      vim.notify 'there is a problem connecting to the accelerator language server'
      return
    end

    vim.lsp.buf_attach_client(0, server)
    print 'accelerator language server found'
  end,
})
