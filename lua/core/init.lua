-- basics
vim.cmd('cd $HOME') -- 初始目录设置为主目录
vim.cmd('syntax on')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('filetype plugin indent on')
vim.opt.linespace      = 6
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
--vim.opt.guifont        = 'SauceCodePro Nerd Font:h14'
if (vim.fn.has('termguicolors') == 1) then
	vim.opt.termguicolors = true
end

-- tabs
vim.opt.autoindent    = true
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.softtabstop   = 4
vim.opt.mouse         = 'a'
vim.opt.smarttab      = true
vim.opt.smartindent   = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.encoding      = 'utf-8'
vim.opt.fileencoding  = 'utf-8'
vim.opt.fileencodings = 'ucs-bom,utf-8,gbk,cp936,latin-1'
vim.opt.wildignore    = '*/tmp/*,*.so,*.swp,*.zip,*.7z,*.tar,*.tar.*,*.rar,.idea,*.png,*.jpg,*.exe,*.dll,*.gif,*.pdf'
vim.opt.nrformats     = 'alpha,octal,hex'


vim.g.neovide_confirm_quit = 1 -- 退出前确认处理未保存的文件
vim.g.sessionoptions = 'buffers,curdir,folds,tabpages'

require("core.plugins")
require("core.keymaps")
-- disable some useless standard plugins to save startup time
-- these features have been better covered by plugins
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
