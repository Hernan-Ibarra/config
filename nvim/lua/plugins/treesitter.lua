return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    vim.treesitter.language.register('typescript', 'acceleratorscript')
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = {
        'lua',
        'python',
        'javascript',
        'typescript',
        'vimdoc',
        'vim',
        'regex',
        'toml',
        'json',
        'java',
        'gitignore',
        'markdown',
        'markdown_inline',
        'bash',
        'tsx',
        'css',
        'html',
        'tmux',
        'astro',
        'tsx',
      },

      -- Install parsers synchronously when set to false (only applied to `ensure_installed`)
      sync_install = false,

      highlight = {
        enable = true,
        disable = {}, -- List of languages (or rather parsers) for which highlight is disabled
      },
      indent = { enable = true },
    }
  end,
}
