local source = {}

function source.new()
	return setmetatable({}, { __index = source })
end

-- 可选方法，触发自动完成的字符
function source:get_trigger_characters()
	return { ',' }
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
	local req = params.context.cursor_before_line
	local _, endPos = string.find(req, [[json:"[%w_]+,]])
	--vim.notify(vim.inspect(params.context.cursor))
	if (endPos ~= nil and endPos == params.context.cursor.col - 1) then
		callback({
			{ label = "omitempty" }
		})
		return
	else
		callback()
	end

end

return source
