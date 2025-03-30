return {
  'nvim-lualine/lualine.nvim',
  config = function()
    local colors = {
      black = '#282828',
      white = '#ebdbb2',
      red = '#fb4934',
      green = '#b8bb26',
      blue = '#83a598',
      yellow = '#fe8019',
      gray = '#a89984',
      darkgray = '#3c3836',
      lightgray = '#504945',
      inactivegray = '#7c6f64',
    }

    local gruvbox_dark = {
      normal = {
        a = { bg = colors.gray, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
      inactive = {
        a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
        b = { bg = colors.darkgray, fg = colors.gray },
        c = { bg = colors.darkgray, fg = colors.gray },
      },
    }

    local mode = {
      'mode',
      fmt = function(str)
        return ' ' .. str
      end,
    }

    local filename = {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0,           -- 0 = just filename, 1 = relative path, 2 = absolute path
    }

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' },
      cond = hide_in_width,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = gruvbox_dark,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch' },
        lualine_c = { filename },
        lualine_x = { diagnostics, diff, { 'filetype' } },
        lualine_y = { 'location' },
        lualine_z = { 'progress' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { { 'location', padding = 0 } },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { 'lazy', 'oil', 'quickfix' },
    }
  end,
}
