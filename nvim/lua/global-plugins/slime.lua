return {
  'jpalardy/vim-slime',
  init = function()
    -- these should be set before the plugin loads
    vim.g.slime_target = 'tmux'
    vim.g.slime_no_mappings = true
  end,
  config = function()
    -- vim.g.slime_input_pid = false
    -- vim.g.slime_suggest_default = true
    -- vim.g.slime_menu_config = false
    -- vim.g.slime_neovim_ignore_unlisted = false

    vim.keymap.set('n', '<leader>rr', '<Plug>SlimeParagraphSend', { remap = true, silent = false })
    vim.keymap.set('x', '<leader>rr', '<Plug>SlimeRegionSend', { remap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', '<Plug>SlimeConfig', { remap = true, silent = false })
  end,
}

