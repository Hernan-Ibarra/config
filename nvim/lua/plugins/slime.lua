return {
  'jpalardy/vim-slime',
  init = function()
    vim.g.slime_target = 'tmux'
    vim.g.slime_no_mappings = 1
  end,
  config = function()
    vim.keymap.set('n', '<leader>rr', '<Plug>SlimeParagraphSend', { remap = true, silent = false })
    vim.keymap.set('x', '<leader>rr', '<Plug>SlimeRegionSend', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', '<Plug>SlimeConfig', { remap = true, silent = false })
  end,
}
