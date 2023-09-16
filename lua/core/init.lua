-- basics
vim.cmd('cd $HOME') -- 初始目录设置为主目录
vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')
vim.opt.linespace      = 4
vim.opt.number         = true -- 启用行号
vim.opt.relativenumber = true -- 启用相对行号, 关闭使用 set nornu  ; 启用使用 set rnu
vim.opt.cursorline     = true -- 光标行高亮
vim.opt.termguicolors  = true
vim.opt.shiftround     = true
vim.opt.updatetime     = 100
vim.opt.autowrite      = true
vim.opt.swapfile       = false -- 即 :set noswapfile
vim.opt.backup         = false -- 即 :set nobackup
vim.opt.writebackup    = true
vim.opt.conceallevel   = 2
--vim.opt.guifont        = 'SauceCodePro Nerd Font:h14'
if (vim.fn.has('termguicolors') == 1) then
  vim.opt.termguicolors = true
end

-- tabs
vim.opt.autoindent    = true
vim.opt.smarttab      = true
-- 设定一个<tab>字符的显示宽度占4个空格
vim.opt.softtabstop   = 4
vim.opt.tabstop       = 4
-- 设定使用空格代替<tab>字符
vim.opt.expandtab     = true
--  执行缩进的宽度，值可以任意设置值，会自动根据需要使用<tab>,和空格组合出相应的缩进宽度，且优先使用<tab>不足时用空格补足宽度. 注意:它是一个local buffer选项
vim.opt.shiftwidth    = 4
vim.opt.mouse         = 'a' -- 如果是 'a' 会导致ssh模式下无法复制
vim.opt.mousemodel    = 'extend'
vim.opt.smartindent   = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.encoding      = 'utf-8'
vim.opt.fileencoding  = 'utf-8'
vim.opt.fileencodings = 'ucs-bom,utf-8,gbk,cp936,latin-1'
vim.opt.wildignore    = '*/tmp/*,*.so,*.swp,*.zip,*.7z,*.tar,*.tar.*,*.rar,.idea,*.png,*.jpg,*.exe,*.dll,*.gif,*.pdf'
vim.opt.nrformats     = 'alpha,octal,hex'


vim.g.neovide_confirm_quit = 1 -- 退出前确认处理未保存的文件
-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.9
vim.g.neovide_background_color = "#0f1117" .. alpha()

vim.g.sessionoptions =
'blank,buffers,curdir,folds,help,tabpages' -- https://github.com/Shatur/neovim-session-manager/issues/47

require("core.plugins")
require("core.keymaps")
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
vim.g.EasyMotion_smartcase     = 1
vim.g.loaded_matchparen        = 1
vim.g.loaded_matchit           = 1
vim.g.loaded_logiPat           = 1
vim.g.loaded_rrhelper          = 1
vim.g.loaded_tarPlugin         = 1
vim.g.loaded_gzip              = 1
vim.g.loaded_zipPlugin         = 1
vim.g.loaded_2html_plugin      = 1
vim.g.loaded_shada_plugin      = 1
vim.g.loaded_spellfile_plugin  = 1
vim.g.loaded_netrw             = 1
vim.g.loaded_netrwPlugin       = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins    = 1
require("core.theme")

-- vim-markdown配置
vim.g.vim_markdown_toc_autofit = 1
vim.g.vim_markdown_fenced_languages = {
  'js=javascript', 'py=python', 'golang=go', 'c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini', 'ts=typescript',
  'md=markdown', 'cs=csharp', 'php', 'rb=ruby'
}
vim.g.vim_markdown_folding_level = 3
vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_strikethrough = 1
vim.g.vim_markdown_conceal = 2
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_conceal_code_blocks = 0

-- Load plugin configs
-- plugins without extra configs are configured directly here
require("impatient") -- lua模块加载加速优化

require("configs.lspconfig").config()
require("configs.bufferline").config()
require("configs.autocomplete").config()
require("configs.filetree").config()
require("configs.treesitter").config()
require("configs.outlinetree").config()
require("configs.git").config()
require("configs.grammar").config()
require("configs.startscreen").config()
require("configs.dap_conf").config()
require("configs.lualine").config()
require("configs.hydra").config()
