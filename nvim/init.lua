-- NOTE: Keymaps and options are best loaded before lazy.
require 'core.options'
require 'core.keymaps'

vim.filetype.add {
  extension = {
    accelerator = 'acceleratorscript',
  },
}

require 'config.lazy'
require 'accelerator-lsp'
