local root_files = { 'go.work', 'go.mod', '.git' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go', 'gomod', 'gowork', 'gotmpl' },
  callback = function(ev)
    vim.lsp.start({
      name = 'gopls',
      cmd = { 'gopls' },
      single_file_support = true,
      root_dir = vim.fs.root(ev.buf, root_files),
    })
  end,
})
