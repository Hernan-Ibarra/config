return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  config = function()
    local markview = require 'markview'

    local config = { preview = { icon_provider = 'devicons' } }
    markview.setup(config)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MarkviewAttach',
      callback = function(event)
        local data = event.data
        local isReadOnly = vim.bo[data.buffer].readonly

        if isReadOnly then
          config.preview.modes = {
            'n',
            'no',
            'nov',
            'noV',
            'noCTRL-V',
            'niI',
            'niR',
            'niV',
            'nt',
            'ntT',
            'v',
            'vs',
            'V',
            'Vs',
            'CTRL-V',
            'CTRL-Vs',
            's',
            'S',
            'CTRL-S',
            'i',
            'ic',
            'ix',
            'R',
            'Rc',
            'Rx',
            'Rv',
            'Rvc',
            'Rvx',
            'c',
            'cr',
            'cv',
            'cvr',
            'r',
            'rm',
            'r',
            '!',
            't',
          }
          markview.setup(config)
        end
      end,
    })
  end,
}
