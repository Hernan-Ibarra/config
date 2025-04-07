vim.wo.spell = true
vim.bo.spellfile = vim.fs.joinpath(vim.fn.stdpath('data'), 'spellfile/en.utf-8.add')

vim.keymap.set('ia', 'h1', '#', { buffer = true })
vim.keymap.set('ia', 'h2', '##', { buffer = true })
vim.keymap.set('ia', 'h3', '###', { buffer = true })
vim.keymap.set('ia', 'h4', '####', { buffer = true })
vim.keymap.set('ia', 'h5', '#####', { buffer = true })
vim.keymap.set('ia', 'h6', '######', { buffer = true })

vim.g.markdown_folding = 1
