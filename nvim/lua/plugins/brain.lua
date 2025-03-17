return {
  'Hernan-Ibarra/brain.nvim',
  config = function()
    vim.keymap.set('n', '<leader>bl', '<cmd>BrainLog<CR>', { desc = 'BrainLog' })
    vim.keymap.set('n', '<leader>ba', '<cmd>BrainAdd<CR>', { desc = 'BrainAdd' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BrainOrganize<CR>', { desc = 'BrainOrganize' })
  end,
}
