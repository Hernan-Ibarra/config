vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opts = function(tbl)
  local defaults = { noremap = true, silent = true }
  return vim.tbl_deep_extend('force', defaults, tbl or {})
end

local map = vim.keymap.set

map({ 'n', 'v' }, '<Space>', '<Nop>',
  opts({ desc = 'Disable the spacebar keys default behavior in Normal and Visual modes' }))

map('n', '<Esc>', ':noh<CR>', opts({ desc = 'Clear search highlights' }))

map('n', 'n', 'nzz', opts({ desc = 'Find and center' }))
map('n', 'N', 'Nzz', opts({ desc = 'Find backwards and center' }))

-- Resizing {{{
map('n', '<Up>', '<cmd>resize +1<CR>', opts({ desc = 'Resize +1 with arrows' }))
map('n', '<Down>', '<cmd>resize -1<CR>', opts({ desc = 'Resize -1 with arrows' }))
map('n', '<Left>', '<cmd>vertical resize +1<CR>', opts({ desc = 'Vertical resize +1 with arrows' }))
map('n', '<Right>', '<cmd>vertical resize -1<CR>', opts({ desc = 'Vertical resize -1 with arrows' })) --}}}

map('n', '<leader>tw', '<cmd>set wrap!<CR>', opts({ desc = 'Toggle line wrapping' }))

map('v', '<', '<gv', opts({ desc = 'Stay in visual mode while removing indent' }))
map('v', '>', '>gv', opts({ desc = 'Stay in visual mode while adding indent' }))

-- Move lines {{{
-- Option + k = ˚ in Mac
-- Option + j = ∆ in Mac
map('n', '˚', '<cmd>m .-2<CR>==', opts({ desc = 'Move line up' }))
map('n', '∆', '<cmd>m .+1<CR>==', opts({ desc = 'Move line down' }))
map('v', '˚', ":m '<-2<CR>gv=gv", opts({ desc = 'Move selection up' }))
map('v', '∆', ":m '>+1<CR>gv=gv", opts({ desc = 'Move selection down' })) --}}}

-- Execute Lua {{{
map('n', '<leader>x', '<cmd>.lua<CR>', opts({ desc = 'Execute line' }))
map('v', '<leader>x', ':lua<CR>', opts({ desc = 'Execute selection' }))
map('n', '<leader>fx', '<cmd>source<CR>', opts({ desc = 'Source file' })) --}}}

map('n', '<leader>dt', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

-- Diagnostics {{{
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' }) --}}}

map('t', '<esc><esc>', '<c-\\><c-n>', { desc = 'Go to normal mode in terminal mode with double escape' })

map('n', '<leader>y', '<cmd>%y<CR>', { desc = 'Yank the whole file' })
map('n', '<leader>v', 'ggVG', { desc = 'Visually select the whole file' })

map('n', '<leader>tf', function()
  local win = vim.api.nvim_get_current_win()
  local fdc = vim.api.nvim_get_option_value('foldcolumn', { win = win })
  if fdc == '0' then
    vim.wo[win].foldcolumn = 'auto:9'
  else
    vim.wo[win].foldcolumn = '0'
  end
end, opts({ desc = 'Toggle foldcolumn' }))
