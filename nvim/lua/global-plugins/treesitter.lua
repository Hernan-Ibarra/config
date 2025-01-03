local langs = {
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
}

return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    local configs = require 'nvim-treesitter.configs'
    configs.setup {
      ensure_installed = langs,

      -- Install parsers synchronously when set to false (only applied to `ensure_installed`)
      sync_install = false,

      -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is the name of the parser) list of language that will be disabled
      highlight = {
        enable = true,
        disable = {}, -- List of languages (or rather parsers) for which highlight is disabled
      },
      indent = { enable = true },
    }
  end,
}
