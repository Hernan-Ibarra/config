if vim.b.current_compiler then
  return
end

vim.b.current_compiler = 'jest'

local compiler_set = function(opt, value)
  vim.cmd.CompilerSet(opt .. '=' .. value)
end

compiler_set('makeprg', 'jest')

compiler_set(
  'errorformat',
  [[^=%-G%[%^\ ]%.%#,%-G%.%#Test\ suite\ failed\ to\ run,%E%.%#SyntaxError:\ %f:\ %m\ (%l:%c),%E%.%#●\ %m,%Z%.%#at\ %.%#\ (%f:%l:%c),%C%.%#,%-G%.%#]]
)
