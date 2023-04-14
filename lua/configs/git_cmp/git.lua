local Job = require 'plenary.job'
local lualine = require('lualine.components.branch.git_branch')
local notify = require('notify')

local source = {}

function source.new()
	return setmetatable({}, { __index = source })
end

-- 可选方法，触发自动完成的字符
function source:get_trigger_characters()
	return { '"', "'", ':' }
end

--[[
---@class cmp.SourceCompletionApiParams
---@field public offset integer
---@field public context cmp.Context
---@field public completion_context lsp.CompletionContext
--]]

--[[
---@class cmp.Context
---@field public id string
---@field public cache cmp.Cache
---@field public prev_context cmp.Context
---@field public option cmp.ContextOption
---@field public filetype string
---@field public time integer
---@field public bufnr integer
---@field public cursor vim.Position|lsp.Position
---@field public cursor_line string
---@field public cursor_after_line string
---@field public cursor_before_line string
--]]

--[[
vim.Position:
{
	line = 10, 
	character=29, 
	row = 11,-- 光标所在行号
	col = 30	-- 光标所在列号
}
--]]

-- 必选方法
--@param params cmp.SourceCompletionApiParams
--@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
	local before = params.context.cursor_before_line
	local after  = params.context.cursor_after_line
	local items  = {
		{ label = "update:" },
		{ label = "fix:" },
		{ label = "feat:" },
		{ label = "refactor:" },
		{ label = "docs:" },
		{ label = "style:" },
		{ label = "test:" },
	}

	local current_branch = ''
	if lualine then
		current_branch = lualine.get_branch()
		local branch = { label = "Merge", insertText = "Merge branch  into " .. current_branch }
		table.insert(items, branch)
	end


	-- merge branch list
	local _, endPos = string.find(before, '[Gg]it%s+commit.*[Mm]erge branch%s+[\'"]')
	local startPos, _ = string.find(after, '^%s*["\']')
	if current_branch ~= nil and current_branch ~= "" and
		endPos ~= nil and endPos == params.context.cursor.col - 1 and (startPos == nil or startPos == 1) then
		Job:new({
			command = 'git',
			args = { 'branch' },
			cwd = lualine.find_git_dir() .. '/..',
			on_exit = function(j, return_val)
				if return_val == 0 then
					local branches = {}
					for _, b in pairs(j:result()) do
						if not string.find(b, "*") then
							local bb = string.gsub(b, "%s", "")
							table.insert(branches, { label = 'branch: ' .. bb, insertText = bb, filterText = bb })
						end
					end
					callback(branches)
				end
			end,
		}):sync()
		return
	end


	-- common commit
	_, endPos = string.find(before, '[Gg]it%s+commit%s+%-m%s*["\']')
	startPos, _ = string.find(after, '%s*["\']')

	if endPos ~= nil and endPos == params.context.cursor.col - 1 and (startPos == nil or startPos == 1) then
		callback(items)
		return
	end

	-- commit file list
	_, endPos = string.find(before, '[Gg]it%s+commit%s+%-m%s*["\'][^\'"]+:%s*$')
	if endPos ~= nil and params.context.cursor.col - endPos <= 2 then
		Job:new({
			command = 'git',
			args = { 'status', '-s', '--untracked-files=no' },
			cwd = lualine.find_git_dir() .. '/..',
			on_exit = function(j, return_val)
				if return_val == 0 then
					local files = {}
					for _, b in pairs(j:result()) do
						table.insert(files, { label = b })
					end
					callback(files)
				end
			end,
		}):sync()
		return
	end
end

return source
