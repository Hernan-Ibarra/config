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

local delete_current_file_and_buffer = function(opts)
  local buf = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(buf)

  if (not buf_name) or buf_name == '' then
    vim.notify('Buffer not associated to a file', vim.log.levels.ERROR)
    return
  end

  if (not opts.bang) and vim.api.nvim_get_option_value('confirm', {}) then
    local message = 'Delete file ' .. vim.fn.fnamemodify(buf_name, ':t') .. '?\nBuffer will be deleted too!'
    local choice = vim.fn.confirm(message, '&Yes\n&No', 0, 'Question')
    if choice ~= 1 then
      return
    end
  end

  local delete_success = (vim.fn.delete(buf_name) == 0)

  if not delete_success then
    vim.notify('Deletion of file' .. buf_name .. ' was unsuccessful.\nAborting...', vim.log.levels.ERROR)
    return
  end

  local arglist_length = vim.fn.argc()
  local arglist_index = vim.fn.argidx()

  local argdelete_success, _ = pcall(function()
    vim.cmd.argdelete '%'
  end)

  vim.api.nvim_buf_delete(buf, { force = true })

  if (not argdelete_success) or arglist_length <= 1 then
    return
  end

  if arglist_index >= arglist_length - 1 then
    vim.cmd.first()
    return
  end

  vim.cmd.argument(arglist_index + 1)
end

vim.api.nvim_create_user_command('DelThis', delete_current_file_and_buffer, {
  desc = 'Delete the current file and buffer',
})

local diff_original = function()
  local this_win = vim.api.nvim_get_current_win()
  local this_buf = vim.api.nvim_win_get_buf(this_win)
  vim.cmd.diffthis()

  local new_buf = vim.api.nvim_create_buf(true, true)
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = this_buf })
  vim.api.nvim_set_option_value('filetype', filetype, { buf = new_buf })

  vim.api.nvim_open_win(new_buf, false, {
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
