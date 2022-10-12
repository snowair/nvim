local fulltime = '2006-01-02 15:04:05'
local fulltime2 = '20060102150405'
local fulldate = '2006-01-02'
local fulldate2 = '20060102'
local time = '15:04:05'
local fulltimeZone = '2006-01-02 15:04:05 -07:00:00'

local source = {}

function source.new()
	return setmetatable({}, { __index = source })
end

-- 可选方法，触发自动完成的字符
function source:get_trigger_characters()
	return { '"' }
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

-- 必选方法
--@param params cmp.SourceCompletionApiParams
--@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
	local req = params.context.cursor_before_line
	--vim.notify(req)
	-- 判断一下如果前面是 time.Parse(", .Format(" , 则触发; 否则不触发
	local start1, _ = string.find(req, [[time%.Parse%s*%(%s*"]])
	local start2, _ = string.find(req, [[%.Format%s*%(%s*"]])
	if (start1 ~= nil and start1 >= 1) or (start2 ~= nil and start2 >= 1) then
		callback({
			{ word = fulltime, label = fulltime, insertText = fulltime, filterText = fulltime },
			{ word = fulltime2, label = fulltime2, insertText = fulltime2, filterText = fulltime2 },
			{ word = fulldate, label = fulldate, insertText = fulldate, filterText = fulldate },
			{ word = fulldate2, label = fulldate2, insertText = fulldate2, filterText = fulldate2 },
			{ word = time, label = time, insertText = time, filterText = time },
			{ word = fulltimeZone, label = fulltimeZone, insertText = fulltimeZone, filterText = fulltimeZone },
		})
		return
	else
		callback()
	end
end

--Resolve completion item (optional). This is called right before the completion is about to be displayed.
--Useful for setting the text shown in the documentation window (`completion_item.documentation`).
--@param completion_item lsp.CompletionItem
--@param callback fun(completion_item: lsp.CompletionItem|nil)
--function source:resolve(completion_item, callback)
--callback(completion_item)
--end

--Executed after the item was selected.
--@param completion_item lsp.CompletionItem
--@param callback fun(completion_item: lsp.CompletionItem|nil)
--function source:execute(completion_item, callback)
--callback(completion_item)
--end

return source
