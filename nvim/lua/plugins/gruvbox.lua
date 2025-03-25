return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup()
    vim.cmd([[highlight @markup.heading.1.markdown cterm=bold gui=bold guifg=#fb4934]])
    vim.cmd([[highlight @markup.heading.2.markdown cterm=bold gui=bold guifg=#fe8019]])
    vim.cmd([[highlight @markup.heading.3.markdown cterm=bold gui=bold guifg=#fabd2f]])
    vim.cmd([[highlight @markup.heading.4.markdown cterm=bold gui=bold guifg=#b8bb26]])
    vim.cmd([[highlight @markup.heading.5.markdown cterm=bold gui=bold guifg=#83a598]])
    vim.cmd([[highlight @markup.heading.6.markdown cterm=bold gui=bold guifg=#d3869b]])
    vim.cmd 'colorscheme gruvbox'
  end,
}
