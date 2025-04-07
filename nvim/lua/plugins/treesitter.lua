return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require 'nvim-treesitter.configs'

    configs.setup {
      ensure_installed = { 'astro', 'bash', 'css', 'git_config', 'gitcommit', 'gitignore', 'go', 'html', 'java', 'javascript', 'json', 'lua', 'make', 'markdown', 'markdown_inline', 'python', 'regex', 'tmux', 'toml', 'tsx', 'typescript', 'vim', 'vimdoc' },

      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = { enable = true }
    }
  end,
}
