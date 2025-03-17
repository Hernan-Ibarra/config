local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

local restore = function(_, snip)
  return snip.captures[1]
end

return {
  s({ trig = '^(%s*)l', trigEngine = "pattern" },
    fmt(
      [[
        {}local {} = {}
      ]], { f(restore), i(1, 'variable'), i(2) }
    )
  ),
  s({ trig = '^(%s*)lf', trigEngine = "pattern" },
    fmt(
      [[
        {r}local {} = function({})
          {r}{}
        {r}end
      ]], { r = f(restore), i(1), i(2), i(3) }
    )
  ),
  s({ trig = '^(%s*)lr', trigEngine = "pattern" },
    fmt(
      [[
        {}local {}{} = require('{}')
      ]], { f(restore), rep(1), i(0), i(1) }
    )
  ),
}
