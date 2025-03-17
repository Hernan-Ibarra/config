return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = 'luasnip',
  config = function()
    local blink = require('blink.cmp')
    local ls = require('luasnip')
    blink.setup({
      keymap = {
        preset = 'default',
        ['<C-k>'] = { 'fallback' },
        ['<C-space>'] = {},
        ['<Tab>'] = {
          function(cmp)
            if ls.expandable() then
              cmp.cancel()
              vim.schedule(function() ls.expand() end)
              return true
            end
          end,
          'fallback'
        },
        ['<S-Tab>'] = {},
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" }
    })
  end
}
