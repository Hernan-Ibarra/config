local opts = function(tbl)
  local defaults = { noremap = true, silent = true }
  return vim.tbl_deep_extend('force', defaults, tbl or {})
end

local set = vim.keymap.set

set({ 'n', 'v' }, '<Space>', '<Nop>',
  opts({ desc = 'Disable the spacebar keys default behavior in Normal and Visual modes' }))

set('n', 'n', 'nzz', opts({ desc = 'Find and center' }))
set('n', 'N', 'Nzz', opts({ desc = 'Find backwards and center' }))

-- Resizing
set('n', '<Up>', '<cmd>resize +1<CR>', opts({ desc = 'Resize +1 with arrows' }))
set('n', '<Down>', '<cmd>resize -1<CR>', opts({ desc = 'Resize -1 with arrows' }))
set('n', '<Left>', '<cmd>vertical resize +1<CR>', opts({ desc = 'Vertical resize +1 with arrows' }))
set('n', '<Right>', '<cmd>vertical resize -1<CR>', opts({ desc = 'Vertical resize -1 with arrows' }))

set('n', '<leader>tw', '<cmd>set wrap!<CR>', opts({ desc = 'Toggle line wrapping' }))

set('v', '<', '<gv', opts({ desc = 'Stay in visual mode while removing indent' }))
set('v', '>', '>gv', opts({ desc = 'Stay in visual mode while adding indent' }))

-- Move lines
-- Option + k = ˚ in Mac
-- Option + j = ∆ in Mac
set('n', '˚', '<cmd>m .-2<CR>==', opts({ desc = 'Move line up' }))
set('n', '∆', '<cmd>m .+1<CR>==', opts({ desc = 'Move line down' }))
set('v', '˚', ":m '<-2<CR>gv=gv", opts({ desc = 'Move selection up' }))
set('v', '∆', ":m '>+1<CR>gv=gv", opts({ desc = 'Move selection down' }))

-- Execute Lua
set('n', '<leader>x', '<cmd>.lua<CR>', opts({ desc = 'Execute line' }))
set('v', '<leader>x', ':lua<CR>', opts({ desc = 'Execute selection' }))
set('n', '<leader>fx', '<cmd>source<CR>', opts({ desc = 'Source file' }))

set('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

-- Diagnostics
set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

set('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Go to normal mode in terminal mode with double escape' })

set('n', '<leader>y', '<cmd>%y<CR>', { desc = 'Yank the whole file' })
set('n', '<leader>v', 'ggVG', { desc = 'Visually select the whole file' })

set('n', '<leader>tf', function()
  local win = vim.api.nvim_get_current_win()
  local fdc = vim.api.nvim_get_option_value('foldcolumn', { win = win })
  if fdc == '0' then
    vim.wo[win].foldcolumn = 'auto:9'
  else
    vim.wo[win].foldcolumn = '0'
  end
end, opts({ desc = 'Toggle foldcolumn' }))

set('n', 'K', function() vim.lsp.buf.hover({ border = 'rounded' }) end, {})
