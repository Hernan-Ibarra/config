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
        'astro',
      }
    end,
  },
  {
    -- Nerdfont icons
    'nvim-tree/nvim-web-devicons',
    opts = {},
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
    opts = {
      background_colour = '#282828',
    },
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      buf_options = {
        buflisted = false,
        bufhidden = 'hide',
        readonly = false,
        modifiable = true,
      },
    },
    keys = {
      { '-', '<CMD>Oil<CR>', desc = '<CMD>Oil<CR>' },
    },
  },
  {
    'Hernan-Ibarra/simple-repl',
    enabled = false,
  },
}
