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

local delete_file = function()
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

vim.api.nvim_create_user_command('Delete', delete_file, {
  desc = 'Delete the current file and buffer',
})
