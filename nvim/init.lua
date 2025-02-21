require 'core.options'
require 'core.keymaps'
require 'config.lazy'

-- INFO: This matches *.accelerator files and sets filetype to 'acceleratorscript'.
vim.filetype.add { extension = { accelerator = 'acceleratorscript' } }
