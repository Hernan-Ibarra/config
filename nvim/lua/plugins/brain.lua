return {
  'Hernan-Ibarra/brain.nvim',
  config = function()
    require('brain').setup({ brain_directory = vim.fs.joinpath(vim.fn.stdpath('data'), 'brain', 'dump') })
    vim.keymap.set('n', '<leader>bd', '<cmd>BrainDump<CR>', { desc = 'BrainDump' })
    vim.keymap.set('n', '<leader>bo', '<cmd>BrainOrganize<CR>', { desc = 'BrainOrganize' })
  end,
}
