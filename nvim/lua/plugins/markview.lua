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
        horizontal_rules = presets.horizontal_rules.dashed
      },
      preview = { icon_provider = 'devicons', modes = preview_modes, ignore_buftypes = {} }
    })

    require("markview.extras.checkboxes").setup({
      --- Default checkbox state(used when adding checkboxes).
      ---@type string
      default = "X",

      --- Changes how checkboxes are removed.
      ---@type
      ---| "disable" Disables the checkbox.
      ---| "checkbox" Removes the checkbox.
      ---| "list_item" Removes the list item markers too.
      remove_style = "disable",

      --- Various checkbox states.
      ---
      --- States are in sets to quickly change between them
      --- when there are a lot of states.
      ---@type string[][]
      states = {
        { " ", "/", "X" },
        { "<", ">" },
        { "?", "!", "*" },
        { '"' },
        { "l", "b", "i" },
        { "S", "I" },
        { "p", "c" },
        { "f", "k", "w" },
        { "u", "d" }
      }
    })

    vim.api.nvim_create_autocmd('User', {
      group = vim.api.nvim_create_augroup('Markview', { clear = true }),
      pattern = "MarkviewAttach",
      callback = function(ev)
        local buf = ev.data.buffer
        vim.keymap.set('n', '<LocalLeader>tt', '<cmd>Checkbox interactive<cr>',
          { desc = '[T]oggle Checkbox', silent = true, buffer = buf })
        vim.keymap.set('n', '<LocalLeader>tm', '<cmd>Markview<cr>',
          { desc = '[T]oggle [M]arkview', silent = true, buffer = buf })
      end
    })
  end
}
