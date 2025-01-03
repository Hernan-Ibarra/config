return {
  -- Main LSP Configuration
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Fuzzy find all the symbols in your current document. Symbols are things like variables, functions, types, etc.
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace. Similar to document symbols, except searches over your entire project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor. Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- The following two autocommands are used to highlight references of the word under your cursor when your cursor rests there for a little while. See `:help CursorHold` for information about when this is executed. When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    -- Enable the following language servers
    -- See `:help lspconfig-all` for a list of all the pre-configured LSPs

    local servers = {
      marksman = {},
      ts_ls = {},
      jdtls = {},
      html = { filetypes = { 'html', 'twig', 'hbs' } },
      lua_ls = {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              -- Tells lua_ls where to find all the Lua files that you have loaded for your neovim configuration.
              library = {
                '${3rd}/luv/library',
                unpack(vim.api.nvim_get_runtime_file('', true)),
              },
            },
            completion = {
              callSnippet = 'Replace',
            },
            telemetry = { enable = false },
            diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
      tailwindcss = {},
      jsonls = {},
      bashls = {},
      cssls = {},
      ltex = {},
      texlab = {},
      ruff = {
        -- Notes on code actions: https://github.com/astral-sh/ruff-lsp/issues/119#issuecomment-1595628355
        -- Get isort like behavior: https://github.com/astral-sh/ruff/issues/8926#issuecomment-1834048218
        commands = {
          RuffAutofix = {
            function()
              vim.lsp.buf.execute_command {
                command = 'ruff.applyAutofix',
                arguments = {
                  { uri = vim.uri_from_bufnr(0) },
                },
              }
            end,
            description = 'Ruff: Fix all auto-fixable problems',
          },
          RuffOrganizeImports = {
            function()
              vim.lsp.buf.execute_command {
                command = 'ruff.applyOrganizeImports',
                arguments = {
                  { uri = vim.uri_from_bufnr(0) },
                },
              }
            end,
            description = 'Ruff: Format imports',
          },
        },
      },

      pylsp = {
        settings = {
          pylsp = {
            plugins = {
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              yapf = { enabled = false },
              mccabe = { enabled = false },
              pylsp_mypy = { enabled = false },
              pylsp_black = { enabled = false },
              pylsp_isort = { enabled = false },
            },
          },
        },
      },
    }

    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }

    for server, config in pairs(servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      require('lspconfig')[server].setup(config)
    end
  end,
}
