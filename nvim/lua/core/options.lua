-- DISPLAY
vim.wo.number = true -- Make line numbers default
vim.o.relativenumber = true -- set relative numbered lines
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.o.cursorline = true -- highlight the current line
vim.o.splitbelow = true -- force all horizontal splits to go below current window
vim.o.splitright = true -- force all vertical splits to go to the right of current window
vim.o.showmode = false -- we don't need to see things like -- INSERT -- anymore because it will be displayed in a status line
vim.o.showtabline = 2 -- show tabs when there are at least 2 tabs
vim.o.pumheight = 10 -- pop up menu (for completion) height
vim.o.conceallevel = 0 -- so that `` is visible in markdown files (see ":help :syn-conceal")
vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.o.cmdheight = 1 -- space in the neovim command line for displaying messages

-- SEARCHING AND COMPLETION
vim.o.hlsearch = false -- Set highlight on search
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.o.smartcase = true -- smart case
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

-- FORMATTING
vim.o.fileencoding = 'utf-8' -- the encoding written to a file
vim.o.expandtab = false -- DO NOT convert tabs to spaces
vim.o.tabstop = 4 -- spaces displayed when inserting a tab character
vim.o.shiftwidth = 0 -- number of spaces inserted for each (auto)indentation (e.g. when using >>). When =0 it uses the value of 'tabstop'
vim.o.autoindent = true -- copy indent from current line when starting new one
vim.o.smartindent = true -- make indenting smarter again
vim.o.backspace = 'indent,eol,start' -- allow backspace (and other deletion motions in insert mode like CTRL-W) on
vim.o.breakindent = true -- Enable break indent
vim.o.linebreak = true -- long lines are broken at special characters (specified with the 'breakat' option) rather than at the last character that fits on display. This only affects the display not the content. 
vim.opt.iskeyword:append '-' -- hyphens recognized as part of words
vim.o.timeoutlen = 500 -- time to wait for a mapped sequence to complete (in milliseconds)

-- OS INTERACTION
vim.o.mouse = 'a' -- Enable mouse mode. Try ":help 'mouse'"
vim.o.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.o.undofile = true -- Save undo history
vim.o.updatetime = 250 -- Decrease update time (The time with nothing being typed for the .swp file to be updated)
