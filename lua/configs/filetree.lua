local M = {}
function M.config()
	-- nvim-tree config
	require 'nvim-tree'.setup {
		disable_netrw        = true,
		hijack_netrw         = true,
		ignore_ft_on_setup   = {},
		auto_reload_on_write = true,
		open_on_tab          = false,
		hijack_cursor        = false,
		--根据 working dir自动同步tree的root; 根据tree root的变化自动修改cwd. 应该设为true, 修改tree root的方式.
		-- 建议使用一全局变量保存项目根目录
		sync_root_with_cwd   = false,
		-- 删掉一些影响操作默认key绑定
		remove_keymaps       = { "<C-e>", "<C-r>", "s", "S", "O", },
		diagnostics          = {
			enable = false,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			}
		},
		update_focused_file  = {
			-- 启用后, 如果当前文件位于tree的子孙级目录, tree会根据当前文件, 自动展开tree并定位到tree的对应位置. 可以使用 :NvimTreeFindFile 手动定位
			enable      = true,
			-- 仅当enable = true时有效. 如果当前文件位于tree的root目录之外, 则自动切换工作目录到这个文件所在目录
			-- 应该设置为false, 因为 :Telescope lsp_definitions 是不能搜索工作目录之外的定义
			update_cwd  = false,
			ignore_list = {}
		},
		system_open          = {
			cmd  = nil,
			args = {}
		},
		filters              = {
			dotfiles = true, -- 是否屏蔽隐藏文件
			custom = {
				".DS_Store",
				".idea"
			}
		},
		git                  = {
			enable = true,
			ignore = true,
			timeout = 500,
		},
		view                 = {
			width            = 30,
			hide_root_folder = false,
			side             = 'left',
			mappings         = {
				custom_only = false,
				list = {}
			},
			number           = false,
			relativenumber   = true,
			signcolumn       = "yes",
		},
		trash                = {
			cmd = "trash",
			require_confirm = true
		},
		actions              = {
			change_dir = {
				global = false,
			},
			open_file = {
				quit_on_open = false,
			}
		},

		-- git扩展
		on_attach = function(bufnr)
			local inject_node = require("nvim-tree.utils").inject_node
			-- history
			vim.keymap.set(
				"n",
				"<c-g>",
				inject_node(function(node)
					if node and node.absolute_path then
						vim.cmd(string.format('DiffviewFileHistory %s', node.absolute_path))
					else
						vim.notify(vim.inspect(node))
					end
				end),
				{ buffer = bufnr, noremap = true }
			)
		end
	}
	vim.cmd([[
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
        \   'arrow_open': "",
        \   'arrow_closed': "",
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   }
        \ }
    ]])
end

return M
