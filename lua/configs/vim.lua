-- 自动保存[No Name]
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
	callback = function()
		local bt = vim.api.nvim_buf_get_option(0, "buftype")
		local ft = vim.api.nvim_buf_get_option(0, "filetype")
		local bn = string.lower(vim.fn.bufname())
		if bt == "" and ft == "" and
			(bn == "[no name]" or bn == "[new file]" or bn == "") then

			local lines = vim.fn.getline(1, 30)
			-- 判断空buf内容长度
			if lines ~= nil and #table.concat(lines, "") > 50 then
				local tmp_dir = vim.fn.stdpath('data') .. '/tmpfile'
				vim.fn.mkdir(tmp_dir, 'p')
				-- 保存到临时文件
				local filename = tmp_dir .. "/" .. vim.fn.strftime("%Y%m%d_%H%M%S") .. '.txt'
				vim.cmd('sav ' .. filename)
			end
		end
	end
})

-- 退出vim之前, 恢复cwd, 然后保存session
-- 需禁用project等自动探测切换cwd的选项.
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	callback = function()
		local sess_dir = vim.env.SESSION_DIR
		if sess_dir ~= nil then
			if vim.fn.exists(':SessionManager') then
				vim.fn.chdir(sess_dir)
				vim.cmd('SessionManager save_current_session')
			end
		end
	end
})

-- 将目录cd历史存起来
vim.api.nvim_create_autocmd({ "DirChangedPre" }, {
	callback = function()
		local dirlist = vim.g.dirChangeHistory
		if dirlist == nil or type(dirlist) ~= "table" then
			dirlist = {}
		end

		local cwd = vim.fn.getcwd()
		vim.env.PRE_WORKING_DIR = cwd
		for _, v in pairs(dirlist) do
			if v == cwd then
				return
			end
		end

		if cwd == vim.env.HOME then
			return
		end
		table.insert(dirlist, cwd)
		vim.g.dirChangeHistory = dirlist
	end
})

-- nvim-tree 的 sync_root_with_cwd 自动同步需要关闭, 他是强制根据cwd同步tree root
-- 而我们希望如果新的cwd是上一个cwd的子目录,则不change root
vim.api.nvim_create_autocmd({ "DirChanged" }, {
	callback = function()
		local cwd = vim.fn.getcwd()
		local predir = vim.env.PRE_WORKING_DIR

		local start, _ = string.find(cwd, predir, 1, true)
		if predir ~= nil then
			if start == 1 then
				return
			end
		end

		local nt_api = require("nvim-tree.api")
		nt_api.tree.change_root(cwd)
	end
})

-- 实现自定义命令 cdlist
-- 默认为选择并切换
-- 使用delete参数,则进入编辑界面
vim.api.nvim_create_user_command('Cdlist', function(params)
	local dirlist = vim.g.dirChangeHistory
	if dirlist == nil or type(dirlist) ~= "table" then
		vim.cmd('echo "cdlist is empty"')
		return
	end

	if params ~= nil then
		if params.args == "delete" or params.args == "del" or params.args == "d" then
			vim.ui.select(dirlist,
				{ prompt = 'Delete a Histroy WD:', },
				function(choice)
					local list = vim.g.dirChangeHistory
					for i, v in pairs(list) do
						if v == choice then
							table.remove(list, i)
							vim.g.dirChangeHistory = list
							return
						end
					end
				end)
		else
			vim.ui.select(dirlist,
				{ prompt = 'Change CWD To:', },
				function(choice)
					vim.fn.chdir(choice)
					vim.cmd('echo "CWD : ' .. choice .. '"')
				end)
		end
	else
		vim.cmd('echo "params is nil " ')
	end

end, { nargs = '?', bang = true, })


-- 实现自定义命令 修改guifont
-- 默认为选择并切换
-- 使用delete参数,则进入编辑界面
vim.api.nvim_create_user_command('FontSize', function(params)

	if params ~= nil then
		local size = tonumber(params.args)
		if size ~= nil and vim.opt.guifont ~= nil then
			local newfont = string.gsub(vim.opt.guifont._value, ':h%d+', ':h' .. params.args)
			vim.cmd(string.format('GuiFont! %s', newfont))
		end
	end

end, { nargs = 1, bang = true, })
