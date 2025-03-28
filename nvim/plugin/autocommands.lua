-- TRESITTER FOLDING
local treesitter_folding = vim.api.nvim_create_augroup("treesitter_folding", { clear = true })

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = treesitter_folding,
  callback = function(ev)
    local buf = ev.buf
    local parsers = require("nvim-treesitter.parsers")
    local lang = parsers.get_buf_lang(buf)
    vim.b[buf].has_treesitter_parser = parsers.has_parser(lang)
  end,
  desc = "Checks whether buffer has treesitter parser"
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = treesitter_folding,
  callback = function(ev)
    local has_parser = vim.b[ev.buf].has_treesitter_parser
    if not has_parser then
      return
    end

    local win = vim.api.nvim_get_current_win()
    local set = vim.wo[win]
    local fdm = vim.api.nvim_get_option_value('foldmethod', { win = win })

    if fdm == 'manual' or fdm == 'syntax' then
      if vim.api.nvim_get_option_value('filetype', { buf = ev.buf }) == 'json' then
        set.foldmethod = "indent"
        return
      end
      set.foldexpr = "nvim_treesitter#foldexpr()"
      set.foldmethod = "expr"
    end
  end,
  desc = "Sets Tresitter folding if parser is found, defaults to syntax folding otherwise"
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
