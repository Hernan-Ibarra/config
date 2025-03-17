-- Acceleratorscript plugin to set up accelerator-lsp
-- Last Change:	21 Feb 2025
-- Maintainer:	Hernán Ibarra
--
if vim.b.did_accelerator_lsp_setup then
  return
end

vim.b.did_accelerator_lsp_setup = false

local path = '/Users/hernan.ibarramejia87/code/accelerator-lsp'
local command = { 'npm', 'run', '--silent', '--prefix', path, 'start' }
local server = vim.lsp.start { name = 'accelerator-lsp', cmd = command }

local notify = vim.notify

if not server then
  notify 'Could not connect to accelerator language server.'
  return
end

vim.lsp.buf_attach_client(0, server)
notify 'Accelerator language server found.'

vim.b.did_accelerator_lsp_setup = true
