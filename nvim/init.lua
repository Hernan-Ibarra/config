-- INFO: This matches *.accelerator files and sets filetype to 'acceleratorscript'.
vim.filetype.add { extension = { accelerator = 'acceleratorscript' } }

require 'core.options'
require 'core.keymaps'
require 'config.lazy'

require 'accelerator-lsp' -- INFO: Sets up accelerator-lsp
