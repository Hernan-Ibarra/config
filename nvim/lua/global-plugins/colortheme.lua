return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = true,
  opts = function()
    require('gruvbox').setup()
    vim.o.background = 'dark' -- 'light' or 'dark'
    vim.cmd 'colorscheme gruvbox'
  end,
}
