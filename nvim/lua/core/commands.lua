local save_and_quit = function(opts)
  vim.cmd.saveas {
    args = { opts.fargs[1] },
    bang = opts.bang,
  }
  vim.cmd.quit { bang = opts.bang }
end

vim.api.nvim_create_user_command('Squit', save_and_quit, {
  nargs = 1,
  desc = 'Save and quit the current buffer under a different filename',
  complete = 'file',
})

local delete_current_file = function()
  local arglist_length = vim.fn.argc()
  local arglist_index = vim.fn.argidx()

  local buf = vim.api.nvim_get_current_buf()
  local full_path = vim.api.nvim_buf_get_name(buf)
  vim.fn.delete(full_path)

  vim.cmd.argdelete '%'
  vim.api.nvim_buf_delete(buf, { force = true })

  if arglist_length == 1 then
    return
  end

  if arglist_index == arglist_length - 1 then
    vim.cmd.argument(1)
    return
  end

  vim.cmd.argument(arglist_index + 1)
end

vim.api.nvim_create_user_command('Delete', delete_current_file, {
  desc = 'Delete the current file and buffer',
})

-- command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_
-- \ | diffthis | wincmd p | diffthis

local diff_original = function()
  local this_win = vim.api.nvim_get_current_win()
  local this_buf = vim.api.nvim_win_get_buf(this_win)
  vim.cmd.diffthis()

  local new_buf = vim.api.nvim_create_buf(true, true)
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = this_buf })
  vim.api.nvim_set_option_value('filetype', filetype, { buf = new_buf })

  local new_win = vim.api.nvim_open_win(new_buf, false, {
    split = 'right',
    win = 0,
  })

  vim.api.nvim_buf_call(new_buf, function()
    vim.cmd('read ++edit #' .. this_buf)
    vim.cmd.diffthis()
  end)
  vim.api.nvim_buf_set_lines(new_buf, 0, 0, false, {})
end

vim.api.nvim_create_user_command('DiffOrig', diff_original, {
  desc = 'See the differences between the current buffer and the file it was loaded from.',
})
