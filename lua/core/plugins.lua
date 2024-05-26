-- packer.nvim,
vim.cmd [[packadd packer.nvim]]
return require('packer').startup({
  function(use)
    use 'wbthomason/packer.nvim'

    -- 使用 :set filetype 查看buf的filetype
    local ignore_ft = {
      '', 'none', 'gitcommit', "gitrebase", "svn", "hgcommit", "help", 'startuptime', "sqls_output",
      "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", 'spectre_panel',
      'Outline', 'alpha', 'telescope', 'floatterm', 'Trouble', '[No Name], [New File]',
      'NvimTree', 'TelescopePrompt', 'guihua', 'nofile',
      'dapui_stacks', 'dapui_breakpoints', 'dapui_scopes', 'dapui_console', 'dapui_watches', 'dap-repl',
      'dan_repl',
      'toggleterm', 'DiffviewFiles', 'DiffviewFileHistory'
    }

    local ignore_bt = { "help", "nofile", "prompt", "popup", "nowrite" }

    --  启动时间优化
    use 'dstein64/vim-startuptime'

    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- 支持lualine,nvim-tree,treesitter的 主题
    use { 'ellisonleao/gruvbox.nvim', requires = { "rktjmp/lush.nvim" }, }
    use { 'rose-pine/neovim', as = 'rose-pine', tag = 'v1.*', }
    use 'EdenEast/nightfox.nvim'
    use 'sainnhe/sonokai'
    use 'rebelot/kanagawa.nvim'
    use { 'catppuccin/nvim', as = 'catppuccin' }

    --  Buffer 增强
    use { 'akinsho/bufferline.nvim',
      tag = "v2.*",
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        -- noremap 用于切换tab ; insert map用于Luasnip
        vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<cr>')
        vim.keymap.set('n', '<A-Tab>', ':BufferLineCycleNext<cr>')
        vim.keymap.set('n', '<D-Tab>', ':BufferLineCycleNext<cr>')
        vim.keymap.set('n', '<M-Tab>', ':BufferLineCycleNext<cr>')
        vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<cr>')
      end
    }

    -- lualine status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }

    -- 文件Tree
    use {
      --`g?`              toggle_help         toggle help
      --`y`    copy_name           copy name to system clipboard
      --`Y`    copy_path           copy relative path to system clipboard
      --`gy`   copy_absolute_path  copy absolute path to system clipboard
      -- `s`               system_open         open a file with default system application or a folder with default file manager, using |system_open| option
      -- `<C-k>`           toggle_file_info    toggle a popup with file infos about the file under the cursor
      -- `-`               dir_up              navigate up to the parent directory of the current file/directory
      -- `r`               rename              rename a file
      -- `a`               create              add a file; leaving a trailing `/` will add a directory
      -- `P`               parent_node         move cursor to the parent directory
      'kyazdani42/nvim-tree.lua',

    }

    -- language
    use {
      -- williamboman/nvim-lsp-installer 的重构版本，自动安装lsp server
      "williamboman/mason.nvim",
      config = function()
        require("mason").setup()
      end
    }
    --  不要关闭 treesitter , 重新全部安装一遍要很久
    use 'nvim-treesitter/nvim-treesitter'
    use 'neovim/nvim-lspconfig'            -- 官方lsp
    use 'L3MON4D3/LuaSnip'                 -- 代码片段, nvim-cmp用到
    use 'molleweide/LuaSnip-snippets.nvim' -- 一些代码片段收集，java/lua/python/rust/c的都有
    use 'onsails/lspkind-nvim'             -- 给自动完成列表添加icon支持
    -- 使用 lsp 的代码文件structrue插件, 支持预览代码和文档, 只能显示当前文件的,不支持按package查看,不支持隐藏不可见成员 :SymbolsOutline
    -- go.nvim 的 GoPkgOutline 支持package级别的outline,但不太稳定
    use {
      'snowair/symbols-outline.nvim',
      config = function()
        require("symbols-outline").setup()
      end
    }

    use 'folke/lsp-colors.nvim' -- 为主题不支持的lsp颜色提供默认支持

    -- 函数参数文字颜色独立
    use {
      'm-demare/hlargs.nvim',
      config = function()
        require('hlargs').setup()
      end
    }

    use({
      'nvimdev/lspsaga.nvim',
      after = 'nvim-lspconfig',
      config = function()
        require("lspsaga").setup({
          lightbulb = {
            enable = false,
          },
          callhierarchy = {
            show_detail = false,
            keys = {
              edit = "o",
              jump = "p",
              vsplit = "v",
              split = "s",
              tabe = "t",
              quit = "q",
              expand_collapse = "u",
            },
          },
          finder = {
            keys = {
              expand_or_jump = 'o',
              jump_to = 'p',
              vsplit = 'v',
              split = 's',
              tabe = 't',
              tabnew = 'r',
              quit = { 'q', '<ESC>' },
              close_in_preview = '<ESC>',
            },
          },
          definition = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>s",
            tabe = "<C-c>t",
            quit = "q",
          }
        })
      end,
    })

    -- 类似goland的, 在函数参数sign位置可以提示该参数的类型
    use {
      'ray-x/lsp_signature.nvim',
      config = function()
        require "lsp_signature".setup({
          bind = true,            -- This is mandatory, otherwise border config won't get registered.
          handler_opts = {
            border = "single"     -- double, rounded, single, shadow, none
          },
          auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
        })
      end
    }


    -- golang
    use {
      'ray-x/go.nvim',
      config = function()
        require('go').setup({
          icons = { breakpoint = "💔", currentpos = "👉" },
          luasnip = true,  -- set true to enable included luasnip
          verbose = false, -- 记录日志,默认记录在  ~/tmp/gonvim.log
        })
      end
    }

    -- debug断点调试支持: go,c/cpp,python,rust,java
    use 'mfussenegger/nvim-dap'             -- 基础
    use 'rcarriga/nvim-dap-ui'              -- dap UI界面
    use 'nvim-telescope/telescope-dap.nvim' -- dap 命令 集成到 telescope ui
    -- 虚拟文本显示调试过的变量的值
    use {
      'theHamsta/nvim-dap-virtual-text',
      config = function()
        require("nvim-dap-virtual-text").setup()
      end
    }


    -- 自动完成
    use {
      'hrsh7th/nvim-cmp',
      requires = 'hrsh7th/cmp-nvim-lsp',
    }
    -- nvim-cmp source 插件
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-buffer'   --使用buffe中的内容作为自动完成词源
    use 'hrsh7th/cmp-cmdline'  -- vim cmdline 支持自动完成
    use 'hrsh7th/cmp-path'     -- 文件路径自动完成
    use 'hrsh7th/cmp-emoji'    -- emoji自动完成
    use 'hrsh7th/cmp-nvim-lua' -- neovim api 自动完成
    --use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }

    -- gitsigns
    use {
      'lewis6991/gitsigns.nvim',
      --tag = 'release',
      config = function()
        require('gitsigns').setup {
          signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- 行号高亮 Toggle with `:Gitsigns toggle_numhl`
          linehl     = false, -- 底色高亮 Toggle with `:Gitsigns toggle_linehl`
          word_diff  = false, -- change word高亮 Toggle with `:Gitsigns toggle_word_diff`
        }
        -- 用到什么加什么
        vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>')
        vim.keymap.set('n', '<leader>hp', ':Gitsigns prev_hunk<cr>')
        vim.keymap.set('n', '<leader>hv', ':Gitsigns preview_hunk<cr>')
      end
    }

    -- trouble
    use {
      'folke/trouble.nvim',
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    -- quickfix 增
    use {
      'stevearc/qf_helper.nvim',
      config = function()
        require('qf_helper').setup()
      end
    }

    -- 工具函数 , 很多插件会依赖它.
    -- All the lua functions I don't want to write twice.
    use 'nvim-lua/plenary.nvim'

    -- todo-comments
    use {
      -- PERF:
      -- TODO:
      -- NOTE:
      -- WARN:
      -- HACK:
      -- BUG:
      -- FIX:
      'folke/todo-comments.nvim',
      --All the lua functions I don't want to write twice.
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require("todo-comments").setup {}
      end
    }

    use {
      'ggandor/leap.nvim',
      config = function()
        require('leap').add_default_mappings()
        vim.api.nvim_del_keymap('v', 'x')
      end
    }


    -- 打开文件时,自动定位到上次的位置
    use {
      'ethanholz/nvim-lastplace',
      config = function()
        require 'nvim-lastplace'.setup {
          lastplace_ignore_buftype = { "quickfix", "nofile", "help", "nvimtree" },
          lastplace_ignore_filetype = ignore_ft,
          lastplace_open_folds = true
        }
      end
    }

    -- add/remove/change surrounding pairs. 修改 Html 标签
    use {
      -- ys[text object][char] 添加包围. 只支持text object 不支持visual mode选择文本
      -- ds[char] 删除包围
      -- cs[char1][char2] 修改包围
      'kylechui/nvim-surround',
      config = function()
        require("nvim-surround").setup {}
      end
    }

    -- 添加支持鼠标操作折叠/展开折叠的 - + 图标
    use {
      'kevinhwang91/nvim-ufo',
      requires = 'kevinhwang91/promise-async',
      config = function()
        require('ufo').setup({
          provider_selector = function()
            return { 'treesitter', 'indent' }
          end
        })
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = -1
        vim.o.foldenable = true
        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      end
    }

    -- 很智能的字段括号插件,支持为自动完成的函数自动添加括号
    use {
      'windwp/nvim-autopairs',
      config = function() require("nvim-autopairs").setup {} end
    }

    -- 自动闭合html,tsx,vue,php的标签
    use {
      'windwp/nvim-ts-autotag',
      config = function()
        require 'nvim-treesitter.configs'.setup {
          autotag = { enable = true, }
        }
      end
    }

    -- indent guide
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("ibl").setup()
      end
    }

    -- cursorline
    use {
      'yamatsum/nvim-cursorline',
      config = function()
        require('nvim-cursorline').setup {
          cursorline = {
            enable = false,
            timeout = 1000,
            number = false,
          },
          cursorword = {
            enable = true,
            min_length = 3,
            hl = { underline = true },
          }
        }
      end
    }

    -- floating terminal
    use 'voldikss/vim-floaterm'

    -- rainbow
    use {
      'p00f/nvim-ts-rainbow',
      config = function()
        require("nvim-treesitter.configs").setup {
          highlight = {
          },
          -- ...
          rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
          }
        }
      end
    }

    -- ctrl-a,ctrl-x增强
    use {
      'monaqa/dial.nvim',
      config = function()
        local fulltime = '2006-01-02 15:04:05'
        local fulltime2 = '20060102150405'
        local fulldate = '2006-01-02'
        local fulldate2 = '20060102'
        local time = '15:04:05'
        local augend = require("dial.augend")
        require("dial.config").augends:register_group {
          default = {
            augend.constant.new {
              elements = { fulltime, fulltime2 },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { fulldate, fulldate2, time },
              word = false,
              cyclic = true,
            },
            -- uppercase hex number (0x1A1A, 0xEEFE, etc.)
            augend.constant.new {
              elements = { "and", "or" },
              word = true,   -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
              cyclic = true, -- "or" is incremented into "and".
            },
            augend.constant.new {
              elements = { "&&", "||" },
              word = false,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'int', 'int32', 'int64' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'uint', 'uint32', 'uint64' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'success', 'error' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'desc', 'asc' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'min', 'max' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'enable', 'disable' },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'enabled', 'disabled' },
              word = true,
              cyclic = true,
            },
            -- golang type
            augend.constant.new {
              elements = { '[]byte(', 'string(', },
              word = false,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'GET', 'POST', },
              word = true,
              cyclic = true,
            },
            augend.constant.new {
              elements = { 'Error', 'Warn', 'Info', 'Debug', },
              word = true,
              cyclic = true,
            },

            augend.integer.alias.decimal,
            augend.integer.alias.hex,
            augend.date.alias["%Y/%m/%d"],
            augend.constant.alias.bool,
            augend.constant.alias.alpha,
            augend.constant.alias.Alpha,
          },
        }
        vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
        vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
        vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
        vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })
      end
    }

    -- 自动格式化插件
    use {
      'lukas-reineke/lsp-format.nvim',
      config = function()
        require("lsp-format").setup {
          yaml = { tab_width = 2 },
          lua = { tab_width = 2 },
        }
        -- go 自动格式
        local on_attach = function(client)
          require("lsp-format").on_attach(client)
          -- 自定义代码
        end
        require("lspconfig").gopls.setup { on_attach = on_attach }
      end
    }

    --  提供 :TableModeToggle  :Tableize
    --  支持添加列,删除列, cell text object
    use 'dhruvasagar/vim-table-mode'

    -- rust 开发工具
    use {
      'simrat39/rust-tools.nvim',
      config = function()
        require('rust-tools').setup({})
      end
    }

    -- 支持 ripgrep args的 live_grep
    use {
      --https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md
      -- glob/g参数示例：
      -- 'keywords' -g '*.toml'   在.toml文件中搜
      -- 'keywords' -g '!*.toml'   在非.toml文件中搜
      --'int main' -g '*.{c,h}'  在.c,.h文件中搜
      -- '\w(?-u:\w)\w'  使用正则进行搜索
      -- 更多参数:
      -- -i/--ignore-case 忽略大小写
      -- -S/--smart-case 智能大小写
      -- -F/--fixed-strings 字符串模式，非正则模式
      -- -w/--word-regexp 相当于正则 \b(?:pattern)\b
      "nvim-telescope/telescope-live-grep-args.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
    }

    -- project.nvim
    use {
      -- 列出历史 projects 列表 :Telescope project
      -- 打开项目文件后,自动cd工作目录到项目根目录;
      'ahmedkhalf/project.nvim',
      require = 'nvim-telescope/telescope.nvim',
      config = function()
        require("project_nvim").setup {
          -- 使用 `:ProjectRoot`命令探测并切换工作目录. 如果设为false,则自动.
          -- 在session manage 不支持SavePre事件之前, 手动设置.不然可能影响正常保存session的目录
          manual_mode = true,
          patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

          -- Don't calculate root dir on specific directories
          -- Ex: { "~/.cargo/*", ... }
          exclude_dirs = {
            '~/go/pkg/mod/gitlab.com/*',
            '~/go/pkg/mod/go.uber.org/*',
            '~/go/pkg/mod/gopkg.in/*',
            '~/go/pkg/mod/golang.org/*',
            '~/go/pkg/mod/google.golang.org/*',
            '~/go/pkg/mod/git.code.oa.com/*',
            '~/go/pkg/mod/git.woa.com/*',
            '~/go/pkg/mod/github.com/*',
            '~/.local/share/nvim/site/pack/packer/start/*',
            '~/.vim/plugged/*',
          },

          -- Show hidden files in telescope
          show_hidden = true,

          -- When set to false, you will get a message when project.nvim changes your
          -- directory.
          silent_chdir = false,
          file_browser = nil,

        }
      end
    }

    -- 自动把vim.ui.input绑定到telescope, 让vi默认的选择组件更现代化
    use {
      'nvim-telescope/telescope-ui-select.nvim',
      require = 'nvim-telescope/telescope.nvim',
    }

    use {
      -- 用於通過搜索的方式切換projects
      -- 搜索是递归的，所以会慢, 适用于搜索和打开项目依赖包
      'cljoly/telescope-repo.nvim',
      require = 'nvim-telescope/telescope.nvim',
    }

    use({
      -- 用於通過指定的workspace切換projects, 适用于工作项目的组织.
      -- workspace下的直接子目录才可能是project,不会递归，利于精确控制项目列表，避免列出不必要的项目.
      "gnikdroy/projections.nvim",
      branch = "pre_release",
      config = function()
        require("projections").setup({
          workspaces = {                        -- Default workspaces to search for
            { "/mnt/wd/Git",     { ".git" } },  --        Documents/dev is a workspace. patterns = { ".git" }
            { "~",               { ".git" } },  --        Documents/dev is a workspace. patterns = { ".git" }
            { "~/git",           { ".git" } },  --        Documents/dev is a workspace. patterns = { ".git" }
            { "~/git/mlol",      { ".git" } },  --        Documents/dev is a workspace. patterns = { ".git" }
            { "~/git/rust-reps", { ".git" } },  --        Documents/dev is a workspace. patterns = { ".git" }
            -- { "~/repos", {} },                        An empty pattern list indicates that all subdirectories are considered projects
            -- "~/dev",                                  dev is a workspace. default patterns is used (specified below)
          },
          -- patterns = { ".git", ".svn", ".hg" },      -- Default patterns to use if none were specified. These are NOT regexps.
          -- store_hooks = { pre = nil, post = nil },   -- pre and post hooks for store_session, callable | nil
          -- restore_hooks = { pre = nil, post = nil }, -- pre and post hooks for restore_session, callable | nil
          -- workspaces_file = "path/to/file",          -- Path to workspaces json file
          -- sessions_directory = "path/to/dir",        -- Directory where sessions are stored
        })

        -- Bind <leader>fp to Telescope projections
        vim.keymap.set("n", "<leader>fp", function() vim.cmd("Telescope projections") end)

        -- Switch to project if vim was started in a project dir
        local switcher = require("projections.switcher")
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
          callback = function()
            if vim.fn.argc() == 0 then switcher.switch(vim.loop.cwd()) end
          end,
        })
      end
    })

    -- emoji图标选择: https://www.unicode.org/Public/emoji/13.1/emoji-test.txt
    use 'nvim-telescope/telescope-symbols.nvim'
    use({
      "princejoogie/dir-telescope.nvim",
      -- telescope.nvim is a required dependency
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        require("dir-telescope").setup({
          hidden = false,           -- 是否搜索因此目录
          respect_gitignore = true, -- 是否尊重.gitignore文件
        })
      end,
    })

    -- telescope
    use {
      -- 超级强大的模糊插件 , 几乎什么都可以搜索, 完美代替ctrpsapce等插件
      'nvim-telescope/telescope.nvim', tag = '0.1.8',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        -- 将任何Telescope 搜索结果 通过 c-t 发送到 Trouble
        local trouble = require("trouble.providers.telescope")
        local telescope = require("telescope")
        telescope.setup {
          defaults = {
            mappings = {
              i = { ["<c-t>"] = trouble.open_with_trouble },
              n = { ["<c-t>"] = trouble.open_with_trouble },
            },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
            },
            repo = {
              list = {
                fd_opts = {
                  "--no-ignore-vcs",
                },
                search_dirs = {
                  "~/git",
                  "~/git/mlol",
                  "~/git/rust-reps",
                  "/mnt/wd/Git",
                },
              },
            },
          }
        }
        vim.cmd('autocmd User TelescopePreviewerLoaded setlocal wrap')   -- 预览窗口自动换行
        vim.cmd('autocmd User TelescopePreviewerLoaded setlocal number') -- 预览窗口显示 行号

        require('telescope').load_extension('projections')
        require("telescope").load_extension "repo"
        require("telescope").load_extension("ui-select")
        require('telescope').load_extension('projects')
        require("telescope").load_extension("live_grep_args")
        require("telescope").load_extension("dir")
      end
    }



    -- AutoSave
    use {
      'qkzk/AutoSave.nvim',
      config = function()
        require("autosave").setup {
          enabled = true,
          events = { "InsertLeave", "TextYankPost", "VimLeave" },
          conditions = {
            exists = true, -- 忽略不存在的文件
            filename_is_not = {},
            filetype_is_not = ignore_ft,
            modifiable = true, -- 忽略readonly文件
          },
          write_all_buffers = false,
          on_off_commands = true,
          clean_command_line_interval = 0,
          debounce_delay = 135
        }
      end
    }

    -- 将session按工作目录保存
    use {
      -- 由于是按cwd保存session,所有切换工作目录会导致新会话产生.
      -- 利用 VimLeavePre 事件, 在关闭vim之前,恢复工作目录到session 最初的目录.
      'Shatur/neovim-session-manager',
      config = function()
        local Path = require('plenary.path')
        local outline = require 'symbols-outline'
        require('session_manager').setup({
          sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions-manager'), -- The directory where the session files will be saved.
          path_replacer = '__',                                                -- The character to which the path separator will be replaced for session files.
          colon_replacer = '++',                                               -- The character to which the colon symbol will be replaced for session files.
          -- Possible values: Disabled, CurrentDir(根据当前cwd加载对应的session), LastSession(总是加载最近的session)
          autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
          autosave_last_session = true,      -- Automatically save last session on exit and on session switch.
          autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
          autosave_ignore_filetypes = ignore_ft,
          autosave_only_in_session = false,  -- Always autosaves session. If true, only autosaves after a session is active.
          max_path_length = 80,              -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
        })

        local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {})
        vim.api.nvim_create_autocmd({ 'User' }, {
          pattern = "SessionSavePre",
          group = config_group,
          callback = function()
            -- 关闭 gitsigns
            vim.cmd('Gitsigns detach_all')
            -- 关闭 treesitter
            vim.cmd('TSDisable highlight')
            -- 关闭 outline
            local state = require('symbols-outline.preview')
            state.preview_buf = nil
            state.preview_win = nil
            state.hover_buf = nil
            state.hover_win = nil
            if outline.view:is_open() then
              outline.view:close()
            end

            -- 关闭diffview,neogit插件的tab
            local tabs = vim.api.nvim_list_tabpages()
            if #tabs > 1 then
              for _, tab in ipairs(tabs) do
                if #tabs == 1 then
                  break
                end
                local wins = vim.api.nvim_tabpage_list_wins(tab)
                local need_close = false
                local tab_bufs = {}
                for _, wid in pairs(wins) do
                  local bid = vim.api.nvim_win_get_buf(wid)
                  table.insert(tab_bufs, bid)
                  local name = string.lower(vim.fn.expand(vim.api.nvim_buf_get_option(bid, 'filetype')))
                  for _, ignore in ipairs({ 'diffview', 'neogit' }) do
                    if string.find(name, ignore) >= 1 then
                      need_close = true
                      break
                    end
                  end
                end
                if need_close then
                  for _, id in pairs(tab_bufs) do
                    vim.api.nvim_buf_delete(id, { force = 1 })
                  end
                end
              end
            end

            -- 保存session之前，关闭当前项目外的文件窗口
            local bufs = vim.api.nvim_list_bufs()
            if vim.env.SESSION_DIR ~= nil then
              local current = vim.fn.expand(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
              if string.find(current, vim.env.SESSION_DIR, 1, true) ~= 1 then
                current = nil
              end

              if current == nil then
                for _, id in pairs(bufs) do
                  local name = vim.fn.expand(vim.api.nvim_buf_get_name(id))
                  if vim.fn.filereadable(name) == 1 and
                      string.find(name, vim.env.SESSION_DIR, 1, true) == 1 then
                    vim.api.nvim_set_current_buf(id)
                    current = name
                    break
                  end
                end
              end

              for _, id in pairs(bufs) do
                if current == nil then
                  current = id
                else
                  local name = vim.fn.expand(vim.api.nvim_buf_get_name(id))
                  if vim.fn.filereadable(name) == 1 and
                      string.find(name, vim.env.SESSION_DIR, 1, true) ~= 1 then
                    vim.api.nvim_buf_delete(id, { force = 1 })
                  end
                end
              end
            end
          end
        })

        vim.api.nvim_create_autocmd({ 'User' }, {
          pattern = "SessionLoadPre",
          group = config_group,
          callback = function()
            vim.cmd('LspStop')
            vim.env.SESSION_DIR = nil
            local chat = require("chatgpt.flows.chat")
            chat.chat = nil
            outline.view = require 'symbols-outline.view':new()
            vim.loop.sleep(300)
            vim.opt.number         = true
            vim.opt.relativenumber = true
          end,
        })

        vim.api.nvim_create_autocmd({ 'User' }, {
          pattern = "SessionLoadPost",
          group = config_group,
          callback = function()
            vim.o.title = true
            vim.o.titlestring = ""
            local f = vim.loop.cwd()
            require("configs.lualine").gitStatusTaskFn()
            -- 关闭 gitsigns
            vim.cmd('Gitsigns attach')
            -- 关闭 treesitter
            vim.cmd('TSEnable highlight')

            if f ~= nil then
              -- 由于此事件是在session的工作空间全部加载完成后执行, 此时cwd可能已经被project插件自动改成git项目的根目录了.
              -- 所以需要禁用它们的自动修改工作目录功能
              vim.env.SESSION_DIR = f

              -- 载入session 重置 dirlist
              vim.g.dirChangeHistory = { f }

              local root_files = {
                f .. '/.git',
                f .. '/.svn',
                f .. '/.hg',
                f .. '/.idea',
                f .. '/go.mod',
                f .. '/package.json',
              }

              local dirs = vim.fn.split(f, "/")
              if dirs ~= nil then
                local project_name = '[ ' .. dirs[#dirs] .. ' ]'
                for _, v in pairs(root_files) do
                  if vim.fn.getftype(v) == 'dir' then
                    vim.o.titlestring = project_name
                  end
                  if vim.fn.getftype(v) == 'file' then
                    vim.o.titlestring = project_name
                  end
                end
              end
            end

            local timer = vim.loop.new_timer()
            timer:start(3000, 0, vim.schedule_wrap(function()
              vim.cmd('LspRestart')
              timer:stop()
            end))
          end
        })
      end
    }

    -- Vim Plugins
    -- 编辑增强
    use 'triglav/vim-visual-increment' -- 列选择的数字或字母递增插件
    use 'mg979/vim-visual-multi'       -- 多列编辑
    use 'tpope/vim-repeat'             -- ctrl+a ctrl+x 操作增强
    use 'terryma/vim-expand-region'    -- 通过+ - 号选择内容插件
    use 'scrooloose/nerdcommenter'     -- 快速注释插件
    use 'kazhala/close-buffers.nvim'   -- :Bdelete menu

    ---- text object增强
    use 'kana/vim-textobj-user'
    use 'kana/vim-textobj-indent'     --  ai/ii  aI/iI
    use 'sgur/vim-textobj-parameter'  --  a,/i,
    use 'mattn/vim-textobj-url'       --  au/iu
    use 'kana/vim-textobj-line'       --  al/il
    use 'glts/vim-textobj-comment'    --  ac/ic/aC
    use 'glts/vim-textobj-indblock'   --  ao/io for a block of indentation (i.e. spaces)
    use 'reedes/vim-textobj-sentence' --  as/is for a sentence of prose (overrides hard-coded native object & motion)
    use {
      'nvim-treesitter/nvim-treesitter-textobjects',
      config = function()
        require 'nvim-treesitter.configs'.setup {
          textobjects = {
            select = {
              enable = true,
              lookahead = true,
              keymaps = {
                ["aF"] = "@function.outer",
                ["iF"] = "@function.inner",
                ["aB"] = "@block.outer",
                ["iB"] = "@block.inner",
                ["aL"] = "@loop.outer",
                ["iL"] = "@loop.inner",
                ["aC"] = "@conditional.outer",
                ["iC"] = "@conditional.inner",
                ["aS"] = "@class.outer",
                ["iS"] = "@class.inner",
              },
              selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise   aaa
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
              },
            },
          },
        }
      end
    }

    use { 'godlygeek/tabular' }

    use { 'preservim/vim-markdown' }

    -- 交换两个text objext
    use {
      -- 在第一个objext上 执行cx{text object}, 然后在到另一个objext上执行cx{text objcet} 即可进行交换. 如果第二个motion和第一个motion相同,可以使用 .
      -- cxx{text objext} Like cx, but use the current line
      -- X{text object} Like cx, but for Visual mode.
      -- cxc 取消
      'tommcdo/vim-exchange'
    }

    -- 可自定义的启动屏幕
    -- 添加 project , session 加载
    use 'leslie255/aleph-nvim'

    -- find and replease 文件内搜索替换
    use {
      -- 可以将搜索结果发送到quickfix窗口
      -- :Spectre
      'windwp/nvim-spectre',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('spectre').setup {}
        --vim.keymap.set('n', '<leader>S', ':Spectre<cr>')
        vim.cmd [[
				nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
				nnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>
				vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
				nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
			]]
      end
    }

    -- 可以打开buffer里，光标处，光标附近的url
    use {
      -- 在doc浮窗里的链接：K 打开光标处的，L打开光标附近的
      'xiyaowong/link-visitor.nvim',
      config = function()
        require("link-visitor").setup({
          open_cmd = nil, -- cmd to open url
          silent = true,  -- disable all prints, `false` by default
        })
      end
    }

    -- 右下角显示 nvim-lsp progress.
    use {
      'j-hui/fidget.nvim', tag = 'legacy',
      config = function()
        require "fidget".setup {}
      end
    }


    -- 可以为none-lsp source 提供lsp特性支持注入; 内置的支持如下，可按需配置并需要安装各自依赖的外部命令
    use {
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
      'jose-elias-alvarez/null-ls.nvim',
      requires = { { 'neovim/nvim-lspconfig' }, { 'nvim-lua/plenary.nvim' } },
      config = function()
        local null_ls = require("null-ls")
        local sources = {
          null_ls.builtins.code_actions.eslint,
          null_ls.builtins.code_actions.gitrebase,
          null_ls.builtins.code_actions.gitsigns,
          null_ls.builtins.formatting.eslint,
          --null_ls.builtins.completion.luasnip,
          --null_ls.builtins.diagnostics.eslint,
          --null_ls.builtins.diagnostics.jsonlint,
          --null_ls.builtins.diagnostics.textlint,
          --null_ls.builtins.diagnostics.tidy,
          --null_ls.builtins.formatting.gofmt,
          --null_ls.builtins.formatting.tidy,
        }
        null_ls.setup({ sources = sources, debug = false })
        require("../configs/go_code_actions") -- 加载自定义的code_actions
      end
    }

    -- 消息通知浮窗, 可以用来发送vim调试消息，实现git远程状态变更跟踪等
    use {
      -- local notify= require("notify")
      -- notify("My super important message")
      -- notify("This is an error message", "error")
      'rcarriga/nvim-notify',
    }

    -- 单词大小写风格切换
    use {
      'johmsalas/text-case.nvim',
      config = function()
        require('textcase').setup {}
        require('telescope').load_extension('textcase')
        vim.api.nvim_set_keymap('n', 'ga.', '<cmd>TextCaseOpenTelescope<CR>', { desc = "Telescope" })
        vim.api.nvim_set_keymap('v', 'ga.', "<cmd>TextCaseOpenTelescope<CR>", { desc = "Telescope" })
      end
    }

    -- 专门的 git diffview插件 , Git ≥ 2.31.0
    use {
      'sindrets/diffview.nvim',
      config = function()
        local actions = require("diffview.actions")
        local lazy = require("diffview.lazy")
        local diffview = lazy.require("diffview")
        require("diffview").setup({
          diff_binaries = true,     -- Show diffs for binaries
          enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
          file_panel = {
            listing_style = "tree", -- One of 'list' or 'tree'
            tree_options = {
              -- Only applies when listing_style is 'tree'
              flatten_dirs = true,             -- Flatten dirs that only contain one single dir
              folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
            },
          },
          file_history_panel = {
            log_options = {
              -- See ':h diffview-config-log_options'
              git = {
                single_file = {
                  diff_merges = "combined",
                },
                multi_file = {
                  diff_merges = "first-parent",
                },
              }
            },
          },
          keymaps = {
            disable_defaults = false, -- Disable the default keymaps
            view = {
              -- The `view` bindings are active in the diff buffers, only when the current
              -- tabpage is a Diffview.
              ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
              ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
              ["gf"]         = actions.goto_file,         -- Open the file in a new split in the previous tabpage
              ["<C-w><C-f>"] = actions.goto_file_split,   -- Open the file in a new split
              ["<C-w>gf"]    = actions.goto_file_tab,     -- Open the file in a new tabpage
              ["<leader>e"]  = actions.focus_files,       -- Bring focus to the files panel
              ["<leader>b"]  = actions.toggle_files,      -- Toggle the files panel.
            },
            file_panel = {
              ["j"]          = actions.next_entry, -- Bring the cursor to the next file entry
              ["k"]          = actions.prev_entry, -- Bring the cursor to the previous file entry.
              ["<down>"]     = actions.next_entry,
              ["<up>"]       = actions.prev_entry,
              ["<cr>"]       = actions.select_entry,       -- Open the diff for the selected entry.
              ["o"]          = actions.select_entry,
              ["-"]          = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
              ["S"]          = actions.stage_all,          -- Stage all entries.
              ["U"]          = actions.unstage_all,        -- Unstage all entries.
              ["X"]          = actions.restore_entry,      -- Restore entry to the state on the left side.
              ["R"]          = actions.refresh_files,      -- Update stats and entries in the file list.
              ["L"]          = actions.open_commit_log,    -- Open the commit log panel.
              ["<c-b>"]      = actions.scroll_view(-0.25), -- Scroll the view up
              ["<c-f>"]      = actions.scroll_view(0.25),  -- Scroll the view down
              ["<tab>"]      = actions.select_next_entry,
              ["<s-tab>"]    = actions.select_prev_entry,
              ["gf"]         = actions.goto_file,
              ["<C-w><C-f>"] = actions.goto_file_split,
              ["<C-w>gf"]    = actions.goto_file_tab,
              ["i"]          = actions.listing_style,       -- Toggle between 'list' and 'tree' views
              ["f"]          = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
              ["<leader>e"]  = actions.focus_files,
              ["<leader>b"]  = actions.toggle_files,
            },
            file_history_panel = {
              ["g!"]            = actions.options,          -- Open the option panel
              ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
              ["y"]             = actions.copy_hash,        -- Copy the commit hash of the entry under the cursor
              ["L"]             = actions.open_commit_log,
              ["zR"]            = actions.open_all_folds,
              ["zM"]            = actions.close_all_folds,
              ["j"]             = actions.next_entry,
              ["<down>"]        = actions.next_entry,
              ["k"]             = actions.prev_entry,
              ["<up>"]          = actions.prev_entry,
              ["<cr>"]          = actions.select_entry,
              ["o"]             = actions.select_entry,
              ["<2-LeftMouse>"] = actions.select_entry,
              ["<c-b>"]         = actions.scroll_view(-0.25),
              ["<c-f>"]         = actions.scroll_view(0.25),
              ["<tab>"]         = actions.select_next_entry,
              ["<s-tab>"]       = actions.select_prev_entry,
              ["gf"]            = actions.goto_file,
              ["<C-w><C-f>"]    = actions.goto_file_split,
              ["<C-w>gf"]       = actions.goto_file_tab,
              ["<leader>e"]     = actions.focus_files,
              ["<leader>b"]     = actions.toggle_files,
            },
            option_panel = {
              ["<tab>"] = actions.select_entry,
              ["q"] = actions.close,
            },
          },
        })
        vim.keymap.set('n', '<leader>df', function()
          vim.cmd("silent! noa wall")
          diffview.open()
        end)
        vim.keymap.set('n', '<leader>dh', function()
          diffview.file_history()
        end)
        vim.keymap.set('n', '<leader>dc', function()
          vim.cmd('tabc')
        end)
      end
    }

    use 'equalsraf/neovim-gui-shim'

    --use { 'kevinhwang91/nvim-hlslens',
    --config = function()
    --require("hlslens").setup()
    --local kopts = { noremap = true, silent = true }
    --vim.api.nvim_set_keymap('n', 'n',
    -- [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    --kopts)
    --vim.api.nvim_set_keymap('n', 'N',
    -- [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    --kopts)
    --vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    --end
    --}


    use "tversteeg/registers.nvim"
    use { 'michaelb/sniprun', run = 'bash ./install.sh' } -- 代码片段执行，写vim lua脚本方便调试

    use { 'NeogitOrg/neogit',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        local neogit = require("neogit")
        neogit.setup {
          signs = {
            -- { CLOSED, OPENED }
            section = { "", "", },
            item = { "", "ﴴ" },
            hunk = { "", "" },
          },
          integrations = {
            diffview = true
          },
          mappings = {
            -- modify status buffer mappings
            status = {
              ["<enter>"] = "Toggle",
              ["<c-enter>"] = "GoToFile",
            }
          }
        }
      end
    }

    --use { "github/copilot.vim", }


    use {
      "voldikss/vim-translator"
    }

    use { "chrisgrieser/nvim-spider" } -- 让 w e b 移动更适合一些
    use { "wellle/targets.vim" }       -- text object

    -- 允许在终端中直接编辑执行的命令,而不用繁琐的使用方向键移动光标
    -- <c-\><c-n> 退出terminal模式, 进入normal模式
    use {
      'chomosuke/term-edit.nvim', tag = 'v1.*',
      config = function()
        -- Calling require 'term-edit'.setup(opts) is mandatory
        require 'term-edit'.setup {
          -- Mandatory option:
          -- Set this to a lua pattern that would match the end of your prompt.
          -- Or a table of multiple lua patterns where at least one would match the
          -- end of your prompt at any given time.
          -- For most bash/zsh user this is '%$ '.
          -- For most powershell/fish user this is '> '.
          -- For most windows cmd user this is '>'.
          prompt_end = '%$ ',
          -- How to write lua patterns: https://www.lua.org/pil/20.2.html
        }
      end
    }

    use({
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup(
          {
            api_key_cmd = nil,
            yank_register = "+",
            edit_with_instructions = {
              diff = false,
              keymaps = {
                accept = "<C-y>",
                toggle_diff = "<C-d>",
                toggle_settings = "<C-o>",
                cycle_windows = "<Tab>",
                use_output_as_input = "<C-i>",
              },
            },
            chat = {
              welcome_message = "Welcome to ChatGPT!",
              loading_text = "Loading, please wait ...",
              question_sign = "",
              answer_sign = "ﮧ",
              max_line_length = 120,
              sessions_window = {
                border = {
                  style = "rounded",
                  text = {
                    top = " Sessions ",
                  },
                },
                win_options = {
                  winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
                },
              },
              keymaps = {
                close = { "<C-c>" },
                yank_last = "<C-y>",
                yank_last_code = "<C-k>",
                scroll_up = "<C-u>",
                scroll_down = "<C-d>",
                new_session = "<C-n>",
                cycle_windows = "<Tab>",
                cycle_modes = "<C-f>",
                select_session = "<Space>",
                rename_session = "r",
                delete_session = "d",
                draft_message = "<C-d>",
                toggle_settings = "<C-o>",
                toggle_message_role = "<C-r>",
                toggle_system_role_open = "<C-s>",
              },
            },
            popup_layout = {
              default = "center",
              center = {
                width = "80%",
                height = "80%",
              },
              right = {
                width = "30%",
                width_settings_open = "50%",
              },
            },
            popup_window = {
              border = {
                highlight = "FloatBorder",
                style = "rounded",
                text = {
                  top = " ChatGPT ",
                },
              },
              win_options = {
                wrap = true,
                linebreak = true,
                foldcolumn = "1",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
              },
              buf_options = {
                filetype = "markdown",
              },
            },
            system_window = {
              border = {
                highlight = "FloatBorder",
                style = "rounded",
                text = {
                  top = " SYSTEM ",
                },
              },
              win_options = {
                wrap = true,
                linebreak = true,
                foldcolumn = "2",
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
              },
            },
            popup_input = {
              prompt = "  ",
              border = {
                highlight = "FloatBorder",
                style = "rounded",
                text = {
                  top_align = "center",
                  top = " Prompt ",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
              },
              submit = "<C-Enter>",
              submit_n = "<Enter>",
            },
            settings_window = {
              border = {
                style = "rounded",
                text = {
                  top = " Settings ",
                },
              },
              win_options = {
                winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
              },
            },
            openai_params = {
              model = "gpt-3.5-turbo",
              frequency_penalty = 0,
              presence_penalty = 0,
              max_tokens = 300,
              temperature = 0,
              top_p = 1,
              n = 1,
            },
            openai_edit_params = {
              model = "code-davinci-edit-001",
              temperature = 0,
              top_p = 1,
              n = 1,
            },
            actions_paths = {},
            show_quickfixes_cmd = "Trouble quickfix",
            predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/f/awesome-chatgpt-prompts/main/prompts.csv",
          }

        )
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })
    --use "Bekaboo/dropbar.nvim"  -- 需要 nvim 0.10

    use {
      'TobinPalmer/rayso.nvim',
      cmd = { 'Rayso' },
      config = function()
        require('rayso').setup()
      end
    }

    use 'anuvyklack/hydra.nvim'

    use {
      "FeiyouG/commander.nvim",
      requires = { "nvim-telescope/telescope.nvim" },
      config = function()
        local commander = require("commander")
        local utils = require('utils.funcs')
        commander.setup({
          integration = {
            telescope = {
              enable = true,
              -- Optional, you can use any telescope supported theme
              theme = require("telescope.themes").commander
            }
          }
        })

        commander.add({
          {
            desc = "Find files in session",
            cmd = utils.find_files_in_session_dir,
          },
          {
            desc = "Find files in cdlist",
            cmd = utils.find_files_in_cdlist,
          },
          {
            desc = "Grep in session",
            cmd = utils.live_grep_in_cdlist,
          },
          {
            desc = "Grep in cdlist",
            cmd = utils.live_grep_in_cdlist,
          },
          {
            desc = "Find hidden files",
            cmd = "<CMD>Telescope find_files hidden=true<CR>",
          },
          {
            desc = "Show document symbols",
            cmd = "<CMD>Telescope lsp_document_symbols<CR>",
          },
          {
            desc = "RestApi Run Requst",
            cmd = '<Plug>RestNvim',
          },
          {
            desc = "RestApi Preview Curl",
            cmd = '<Plug>RestNvimPreview',
          },
          {
            desc = "RestApi Replay Last",
            cmd = '<Plug>RestNvimLast',
          }
        })
      end
    }

    use {
      "rest-nvim/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Keep the http file buffer above|left when split horizontal|vertical
          result_split_in_place = true,
          -- stay in current windows (.http file) or change to results window (default)
          stay_in_current_window_after_split = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = true,
          -- Encode URL before making request
          encode_url = true,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 5000,
          },
          result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            -- show the generated curl command in case you want to launch
            -- the same request via the terminal (can be verbose)
            show_curl_command = false,
            show_http_info = true,
            show_headers = true,
            -- table of curl `--write-out` variables or false if disabled
            -- for more granular control see Statistics Spec
            show_statistics = false,
            -- executables or functions for formatting response body [optional]
            -- set them to false if you want to disable them
            formatters = {
              json = "jq",
              html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
              end
            },
          },
          -- Jump to request line on run
          jump_to_request = false,
          env_file = '.env',
          custom_dynamic_variables = {},
          yank_dry_run = true,
          search_back = true,
        })
      end
    }

    use {
      "jellydn/hurl.nvim",
      requires = { "MunifTanjim/nui.nvim" },
      config = function()
        require("hurl").setup({
          -- Show debugging info
          debug = false,
          -- Show notification on run
          show_notification = true,
          -- Show response in popup or split
          mode = "split",
          -- Default formatter
          formatters = {
            json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
            html = {
              'prettier',    -- Make sure you have install prettier in your system, e.g: npm install -g prettier
              '--parser',
              'html',
            },
          },
        })
      end
    }

    use {
      -- base64,url,html,hex,binary编解码
      -- 需要 pip install neovim
      "yechielw/vve"
    }

    use {
      "Zeioth/garbage-day.nvim",
    }

    use "Pocco81/HighStr.nvim"
  end,

  config = { max_jobs = 5 }
})
