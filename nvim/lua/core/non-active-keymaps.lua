-- For conciseness
local opts = { noremap = true, silent = true }

-- TODO: Activate when I have some autocommands
--
-- save file without triggering autocommands
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)

-- TODO: Decide on whether the below is a good thing.
--
-- Allow moving the cursor through wrapped lines with j, k. I'm undecided on whether this is a good thing. It might be worth activitating only for certain filetypes.
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)   -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)     --  go to next tab
vim.keymap.set('n', '<leader>tN', ':tabp<CR>', opts)     --  go to previous tab
