-- Squit
local save_and_quit = function(mods)
  vim.cmd.saveas {
    args = { mods.fargs[1] },
    bang = mods.bang,
  }
  vim.cmd.quit { bang = mods.bang }
end

vim.api.nvim_create_user_command('Squit', save_and_quit, {
  nargs = 1,
  desc = 'Save and quit the current buffer under a different filename',
  complete = 'file',
})

-- DelThis
local delete_current_file_and_buffer = function(mods)
  local buf = vim.api.nvim_get_current_buf()
  local buf_name = vim.api.nvim_buf_get_name(buf)

  if (not buf_name) or buf_name == '' then
    vim.notify('Buffer not associated to a file', vim.log.levels.ERROR)
    return
  end

  if (not mods.bang) and vim.api.nvim_get_option_value('confirm', {}) then
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

---Creates a new scratch buffer with the same filetype as the argument
---@param buf? integer
---@return integer
local scratch_from_buf = function(buf)
  local this_buf = buf or vim.api.nvim_get_current_buf()
  local scratch_buf = vim.api.nvim_create_buf(true, true)
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = this_buf })
  vim.api.nvim_set_option_value('filetype', filetype, { buf = scratch_buf })
  return scratch_buf
end

vim.api.nvim_create_user_command('Scratch', function()
  local scratch_buf = scratch_from_buf()
  vim.cmd.buffer(scratch_buf)
end, {
  desc = 'Open a new scratch buffer in the same window',
})

-- DiffOrig
local diff_original = function()
  local this_win = vim.api.nvim_get_current_win()
  local this_buf = vim.api.nvim_win_get_buf(this_win)
  vim.cmd.diffthis()

  local new_buf = scratch_from_buf(this_buf)

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

-- Help
vim.api.nvim_create_user_command('Help', function(mods)
  vim.cmd.help(mods.fargs[1])
  vim.cmd.only { bang = mods.bang }
end, {
  desc = 'Like :help but as the only window',
  nargs = '?',
  complete = 'help',
})

-- Redir
local function redir_to_scratch(data)
  local cmd = data.args

  local output = vim.fn.split(vim.fn.execute(cmd), "\n")

  if cmd:sub(1, 1) == '!' then
    output = vim.list_slice(output, 3)
  end

  local out_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(out_buf, 0, -1, false, output)

  if vim.g.redir_win then
    vim.api.nvim_win_set_buf(vim.g.redir_win, out_buf)
    return
  end

  local win = vim.api.nvim_open_win(out_buf, true, { vertical = data.smods.vertical })
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = { string.format("%d", win) },
    callback = function()
      vim.g.redir_win = nil
    end,
  })
  vim.g.redir_win = win
end

vim.api.nvim_create_user_command("Redir", redir_to_scratch,
  { nargs = "+", complete = "command", desc = "Redirect output of command to a scratch buffer" })

--TeamsMessage
---Creates a new scratch markdown buffer that goes to your clipboard as rtf
local scratch_teams_message = function()
  local scratch_buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_set_option_value('filetype', 'markdown', { buf = scratch_buf })
  vim.cmd("$tabnew")
  vim.cmd.buffer(scratch_buf)

  vim.keymap.set('n', '<CR>', function()
    local lines = vim.api.nvim_buf_get_lines(scratch_buf, 0, -1, false)
    local pandoc_cmd = vim.split('pandoc -t rtf -s', ' ', { plain = true, trimempty = true })
    local obj = vim.system(pandoc_cmd, { stdin = lines }):wait()

    if obj.code ~= 0 then
      vim.notify('Could not convert to rtf', vim.log.levels.ERROR)
      return
    end

    vim.system({ 'pbcopy' }, { stdin = vim.split(obj.stdout, '\n') })
  end, { buffer = scratch_buf })
end

vim.api.nvim_create_user_command("TeamsMessage", scratch_teams_message,
  { nargs = 0, desc = "Creates a scratch markdown buffer to copy as rtf" })
