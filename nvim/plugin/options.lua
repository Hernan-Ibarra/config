-- DISPLAY
vim.wo.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.showmode = false
vim.o.pumheight = 10
vim.o.conceallevel = 0
vim.opt.shortmess:append 'c'
vim.o.cmdheight = 1
vim.o.signcolumn = 'yes'
vim.o.background = 'dark'
vim.o.wrap = false
vim.opt.foldopen:remove 'hor'
vim.o.foldlevelstart = 99
vim.o.list = true
vim.opt.listchars = {
  tab = "▏ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  leadmultispace = "▏ "
}

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- SEARCHING AND COMPLETION
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.completeopt = 'fuzzy,menuone,noinsert,popup'
vim.o.inccommand = 'split'
vim.opt.dictionary:append { '/usr/share/dict/words' }

-- FORMATTING
vim.o.expandtab = false
vim.o.tabstop = 8
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.timeoutlen = 500

-- OS INTERACTION
vim.o.mouse = 'a'
vim.o.undofile = true
vim.o.updatetime = 250
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)
-- vim.o.exrc = true
vim.o.belloff = ''
vim.o.confirm = true

-- SPELLING
vim.o.spelllang = 'en_gb'
vim.o.spelloptions = 'camel,noplainbuffer'
