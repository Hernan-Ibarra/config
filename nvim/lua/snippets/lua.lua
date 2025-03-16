local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
return {
  s({ trig = 'l' },
    fmt(
      [[
        local {} = {}
      ]], { i(1, 'variable'), i(2) }
    )
  ),
  s({ trig = 'lf' },
    fmt(
      [[
        local {} = function({})
          {}
        end
      ]], { i(1), i(2), i(3) }
    )
  ),
  s({ trig = 'lr' },
    fmt(
      [[
        local {} = require('{}')
      ]], { i(1), i(2) }
    )
  ),
}
