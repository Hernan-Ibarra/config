vim.api.nvim_create_autocmd({ "FileType" }, {
  callback = function()
    local win = vim.api.nvim_get_current_win()
    local set = vim.wo[win]
    local fdm = vim.api.nvim_get_option_value('foldmethod', { win = win })
    if (fdm == 'manual' or fdm == 'syntax') and require("nvim-treesitter.parsers").has_parser() then
      set.foldmethod = "expr"
      set.foldexpr = "nvim_treesitter#foldexpr()"
    else
      set.foldmethod = "syntax"
    end
  end,
})

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
})
