local path = '/Users/hernan.ibarramejia87/code/accelerator-lsp'

return {
  cmd = { 'npm', 'run', '--silent', '--prefix', path, 'start' },
  filetypes = { 'acceleratorscript' }
}
