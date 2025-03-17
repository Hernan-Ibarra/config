return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  name = 'luasnip',
  build = "make install_jsregexp",
  config = function()
    local ls = require("luasnip")
    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      ls.jump(1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-S>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
    require("luasnip").config.set_config({ update_events = 'TextChanged,TextChangedI' })
    require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath('config') .. "/lua/snippets" })
  end
}
