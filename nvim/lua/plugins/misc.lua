-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },

  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        'css',
        'html',
      }
    end,
  },
  {
    -- Nerdfont icons
    'nvim-tree/nvim-web-devicons',
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'rcarriga/nvim-notify',
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {},
    keys = {
      { '-', '<CMD>Oil<CR>', desc = '<CMD>Oil<CR>' },
    },
  },
  {
    'tjdevries/present.nvim',
  },
  {
    'Hernan-Ibarra/simple-repl',
    enabled = false,
  },
}
