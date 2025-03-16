local root_files = {
  '.luarc.json',
  '.luarc.jsonc',
  '.luacheckrc',
  '.stylua.toml',
  'stylua.toml',
  'selene.toml',
  'selene.yml',
  '.git',
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function(ev)
    vim.lsp.start({
      name = 'lua-language-server',
      cmd = { 'lua-language-server' },
      single_file_support = true,
      root_dir = vim.fs.root(ev.buf, root_files),
      settings = {
        Lua = {
          format = {
            defaultConfig = {
              indent_style = "space",
              indent_size = "2",
            }
          },
          diagnostics = {
            neededFileStatus = { ['codestyle-check'] = "Any" }
          }
        }
      },
      -- Make language server aware of vim-specific variables
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME
            }
          }
        })
      end
    })
  end,
})
