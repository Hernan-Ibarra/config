local preview_modes = { 'n', 'no', 'nov', 'noV', 'noCTRL-V', 'v', 'V', 'CTRL-V', 'c', 'cr', 'cv', 'cvr', 'r', 'rm', 'r',
  '!' }

return {
  'OXY2DEV/markview.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons", opts = {} },
  lazy = false,
  config = function()
    local presets = require('markview.presets')
    require('markview').setup({
      markdown = {
        headings = presets.headings.glow_center,
        horizontal_rules = presets.horizontal_rules.dashed
      },
      preview = { icon_provider = 'devicons', modes = preview_modes }
    })

    vim.api.nvim_create_autocmd('User', {
      group = vim.api.nvim_create_augroup('Markview', { clear = true }),
      pattern = "MarkviewAttach",
      callback = function(ev)
        local buf = ev.data.buffer
        vim.keymap.set('n', '<LocalLeader>tm', '<cmd>Markview<cr>',
          { desc = '[T]oggle [M]arkview', silent = true, buffer = buf })
      end
    })
  end
}
