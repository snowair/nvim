local M = {}

local Job = require 'plenary.job'
local notify = require 'notify'
local stateCache = {
	hasRemote = false,
	update = 0,
	state = '  ',
}

local function checkLocalCommit(info)
	Job:new({
		command = 'git',
		args = { 'rev-parse', '--short', 'HEAD' },
		cwd = vim.loop.cwd(),
		env = {},
		on_exit = function(j, _)
			if j.code == 0 then
				if #j._stdout_results == 1 then
					local current_commit = j._stdout_results[1]
					if string.find(info,current_commit)>=1 then
						stateCache.state = '  '
					else
						stateCache.state = "   "
					end
				end
			end
		end,
	}):start()
end

local function getForwardNum()
	Job:new({
		command = 'git',
		args = { 'rev-list', 'HEAD','--not', '--remotes', '|', 'wc', '-l', 'awk', "'{print $1}'" },
		cwd = vim.loop.cwd(),
		env = {},
		on_exit = function(j, _)
			if j.code == 0 then
				notify(vim.inspect(j._stderr_results))
			end
		end,
	}):start()

end

local timer = vim.loop.new_timer()
local runing = false
timer:start(0, 5000, vim.schedule_wrap(function()
	stateCache.update = stateCache.update + 1
	if runing then
		return
	end
	runing = true
	Job:new({
		command = 'git',
		args = { 'fetch', '--dry-run' },
		cwd = vim.loop.cwd(),
		env = {},
		on_exit = function(j, _)
			if j.code == 0 then
				--notify(vim.inspect(j._stderr_results))
				if #j._stderr_results == 0 then
					-- 没有远程更新
					getForwardNum()
				else
					-- 有远程更新
					checkLocalCommit(j._stderr_results[2])
				end

			end
			runing = false
		end,
	}):start()
end))


local function update_branch_status()
	return stateCache.state
end

M.config = function()
	local function nvimtree_branch()
		local b = require 'lualine.components.branch.git_branch'.get_branch()
		if b == "" then
			return ""
		end
		return " " .. b
	end

	local NvimTree = {
		filetypes = { 'NvimTree' },
		sections = {
			lualine_a = {
				{
					'branch',
					color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
					separator = { right = '' },
					left_padding = 2,
				},
			},
		},
		inactive_sections = {
			lualine_a = {
				{
					nvimtree_branch,
					color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
					separator = { right = '' },
					left_padding = 2,
				}
			}
		}
	}

	--  lualine theme设置
	require('lualine').setup {
		options = {
			component_separators = '|',
			section_separators = { left = '', right = '' },
		},
		sections = {
			lualine_a = {
				{ 'mode', separator = { left = '' }, right_padding = 2 },
			},
			lualine_b = {
				{ 'branch',
					color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
				},
				'diff',
				{
					'filename',
					file_status = true, -- Displays file status (readonly status, modified status)
					path = 1, -- 0: Just the filename
					-- 1: Relative path
					-- 2: Absolute path
					-- 3: Absolute path, with tilde as the home directory
					shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					-- for other components. (terrible name, any suggestions?)
					symbols = {
						modified = '[+]', -- Text to show when the file is modified.
						readonly = '[RO]', -- Text to show when the file is non-modifiable or readonly.
						unnamed = '[No Name]', -- Text to show for unnamed buffers.
					}
				},
				'diagnostics',
			},
			lualine_c = {
				update_branch_status,
			},
			lualine_x = { 'fileformat', },
			lualine_y = { 'filetype', 'encoding', 'filesize', 'location' },
			lualine_z = {
				{ 'progress', separator = { right = '' }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = {
				{
					'filename', -- TODO: 样式很不明显,改进一下
					path = 1
				},
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { 'quickfix', 'chadtree', 'symbols-outline', 'toggleterm', 'nvim-dap-ui', 'mundo', NvimTree }
	}
end

return M
