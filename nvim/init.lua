require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  require 'global-plugins.colortheme',
  require 'global-plugins.neotree',
  require 'global-plugins.bufferline',
  require 'global-plugins.lualine',
  require 'global-plugins.treesitter',
  require 'global-plugins.telescope',
  require 'global-plugins.lsp',
  require 'global-plugins.autocompletion',
  require 'global-plugins.autoformatting',
  require 'global-plugins.gitsigns',
  require 'global-plugins.alpha',
  require 'global-plugins.indent-blankline',
  require 'global-plugins.misc',
}
