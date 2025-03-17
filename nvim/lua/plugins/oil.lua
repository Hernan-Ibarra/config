return {
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
  lazy = false,
  config = function()
    require('oil').setup({
      buf_options = {
        readonly = false,
        modifiable = true,
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
