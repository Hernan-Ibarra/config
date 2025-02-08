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
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
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
}
