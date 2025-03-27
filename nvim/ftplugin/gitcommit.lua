local buf = vim.api.nvim_get_current_buf()

if vim.b[buf].did_gitcommit_select then
  return
end

vim.schedule(function()
  vim.cmd.normal { args = { "gggH" }, bang = true }
end)

vim.b[buf].did_gitcommit_select = true
