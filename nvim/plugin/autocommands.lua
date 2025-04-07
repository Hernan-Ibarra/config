-- START TREESITTER
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
  desc = "Start Treesitter"
})

-- FOLDING
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local ft = args.match
    local skipped = { 'markdown', 'json' }
    if vim.list_contains(skipped, ft) then
      return
    end
    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  end,
  desc = "Start Treesitter"
})

-- REMEMBER LAST LOCATION
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Attempts to set cursor to position when last exiting the current buffer"
})
