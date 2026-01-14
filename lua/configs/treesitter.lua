local M = {}
function M.config()
  -- nvim-treesitter config
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash", "c", "cmake", 'cpp', 'css', 'dart', 'go', 'gomod', 'http', 'java', 'json',
      'kotlin', 'lua',
      'make', 'perl', 'php', 'proto', 'python', 'ruby', 'rust', 'typescript', 'vim', 'yaml',
    },                                                   -- for installing all maintained parsers
    sync_install = true,                                 -- install synchronously
    ignore_install = { "markdown", " markdown_inline" }, -- parsers to not install
    highlight = {
      enable = true,
      disable = { "markdown", " markdown_inline" }, -- 禁用nvim-treesitter markdown; 因为和vim-markdown冲突
      additional_vim_regex_highlighting = false
    },
  }
end

return M
