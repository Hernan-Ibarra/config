return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup({
      overrides = {
        ['@markup.heading.1.markdown'] = { fg = '#fb4934', bg = '', bold = true },
        ['@markup.heading.2.markdown'] = { fg = '#fe8019', bg = '', bold = true },
        ['@markup.heading.3.markdown'] = { fg = '#fabd2f', bg = '', bold = true },
        ['@markup.heading.4.markdown'] = { fg = '#b8bb26', bg = '', bold = true },
        ['@markup.heading.5.markdown'] = { fg = '#83a598', bg = '', bold = true },
        ['@markup.heading.6.markdown'] = { fg = '#d3869b', bg = '', bold = true },
      }
    })
    vim.cmd 'colorscheme gruvbox'
  end,
}
