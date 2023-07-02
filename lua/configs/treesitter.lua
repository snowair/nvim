local M = {}
function M.config()
  -- nvim-treesitter config
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
      "bash", "c", "cmake", 'cpp', 'css', 'dart', 'go', 'gomod', 'html', 'http', 'java', 'json',
      'javascript', 'kotlin', 'lua',
      'make', 'perl', 'php', 'proto', 'python', 'ruby', 'rust', 'scss', 'sql', 'typescript', 'vim', 'vue', 'yaml',
    },                                                     -- for installing all maintained parsers
    sync_install = false,                                  -- install synchronously
    ignore_install = { "markdown", " markdown_inline" },   -- parsers to not install
    highlight = {
      enable = true,
      disable = { "markdown", " markdown_inline" },     -- 禁用nvim-treesitter markdown; 因为和vim-markdown冲突
      additional_vim_regex_highlighting = false
    },
  }
end

return M
