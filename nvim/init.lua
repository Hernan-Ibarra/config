require 'config.options'
require 'config.keymaps'
require 'config.user-commands'
require 'config.lazy'
require 'config.lsp'
require 'config.autocommands'

-- INFO: This matches *.accelerator files and sets filetype to 'acceleratorscript'.
vim.filetype.add { extension = { accelerator = 'acceleratorscript' } }
