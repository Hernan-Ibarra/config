-- Keymaps for better default experience
-- See :help vim.keymap.set

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- Find and center
-- (recall that zv unfolds folded text)
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', opts)

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
-- Option + j = ∆ in Mac
-- Option + k = ˚ in Mac
vim.keymap.set('n', '∆', ':m .+1<CR>==', opts)
vim.keymap.set('n', '˚', ':m .-2<CR>==', opts)
vim.keymap.set('i', '∆', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '˚', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('v', '∆', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '˚', ":m '<-2<CR>gv=gv", opts)

-- Execute lua
vim.keymap.set('n', '<leader>x', ':.lua<CR>')
vim.keymap.set('v', '<leader>x', ':lua<CR>')

-- Toggle diagnostics
vim.keymap.set('n', '<leader>dt', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = 'Toggle diagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Go to normal mode in terminal mode with double escape
vim.keymap.set('t', '<esc><esc>', '<c-\\><c-n>')

-- Yank the whole file
vim.keymap.set('n', '<leader>y', ':%y<CR>')
