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
    use 'EdenEast/nightfox.nvim'

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

    -- 工具函数 , 很多插件会依赖它.
    -- All the lua functions I don't want to write twice.
    use 'nvim-lua/plenary.nvim'

    use {
      'ggandor/leap.nvim',
      config = function()
        require('leap').add_default_mappings()
        vim.api.nvim_del_keymap('v', 'x')
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

    --  提供 :TableModeToggle  :Tableize
    --  支持添加列,删除列, cell text object
    use 'dhruvasagar/vim-table-mode'

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
          workspaces = {                   -- Default workspaces to search for
            { "/mnt/wd/Git", { ".git" } }, --        Documents/dev is a workspace. patterns = { ".git" }
            { "~",           { ".git" } }, --        Documents/dev is a workspace. patterns = { ".git" }
            { "~/git",       { ".git" } }, --        Documents/dev is a workspace. patterns = { ".git" }
            { "~/git/mlol",  { ".git" } }, --        Documents/dev is a workspace. patterns = { ".git" }
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
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
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
        require("telescope").load_extension("dir")
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

    use { 'godlygeek/tabular' }

    use { 'preservim/vim-markdown' }

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

    -- 消息通知浮窗, 可以用来发送vim调试消息，实现git远程状态变更跟踪等
    use {
      -- local notify= require("notify")
      -- notify("My super important message")
      -- notify("This is an error message", "error")
      'rcarriga/nvim-notify',
    }

    use { 'michaelb/sniprun', run = 'bash ./install.sh' } -- 代码片段执行，写vim lua脚本方便调试

    use { "wellle/targets.vim" }                          -- text object

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
  end,
  config = { max_jobs = 5 }
})
