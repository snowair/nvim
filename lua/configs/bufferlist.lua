local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_utils = require "telescope.actions.utils"
local notify = require('notify')
local conf = require("telescope.config").values

local function get_bufs()
	-- {bufnr,name,shortname,path,onlyname}
	local items = {}
	for _, bufnr in pairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufnr) and vim.fn.buflisted(bufnr)==1 then
			local name = vim.fn.expand(vim.api.nvim_buf_get_name(bufnr))
			if vim.fn.filereadable(name)==1 then
				local shortname = vim.fs.basename(name)
				local onlyname = shortname
				local arr = vim.fn.split(shortname, '\\.')
				if #arr >= 2 then
					table.remove(arr, #arr)
					onlyname = vim.fn.join(arr, '.')
				end
				local path = vim.fs.dirname(name)
				if #shortname > 0 then
					table.insert(items, { bufnr, name, shortname, path, onlyname })
				end
			end
		end
	end

	return items
end

local function open_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local buf_entries = {}
	action_utils.map_entries(prompt_bufnr, function(entry, _, row)
		if current_picker._multi:is_selected(entry) then
			table.insert(buf_entries, entry.value)
		end
	end)

	actions.close(prompt_bufnr)
	if #buf_entries == 1 then
		vim.api.nvim_set_current_buf(buf_entries[1])
		return
	end
	if #buf_entries <= 3 then

		return
	end
	if #buf_entries == 4 then

		return
	end
	if #buf_entries == 5 then

		return
	end
	if #buf_entries == 6 then

		return
	end
end

local function delete_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	action_utils.map_entries(prompt_bufnr, function(entry, _, row)
		if current_picker._multi:is_selected(entry) then
			if vim.api.nvim_get_current_buf() ~= entry.value[1] then
				vim.api.nvim_buf_delete(entry.value[1], { force = 1 })
			end
		end
	end)
	actions.close(prompt_bufnr)
end

local function reverse_delete_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	action_utils.map_entries(prompt_bufnr, function(entry, _, row)
		if not current_picker._multi:is_selected(entry) then
			if vim.api.nvim_get_current_buf() ~= entry.value[1] then
				vim.api.nvim_buf_delete(entry.value[1], { force = 1 })
			end
		end
	end)
	actions.close(prompt_bufnr)
end

local function show_buffers_list(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Buffers",
		finder = finders.new_table({
			results = get_bufs(),
			entry_maker = function(entry)
				return {
					value = entry,
					filename = entry[2], -- 用于回车选择
					bufnr = entry[1], -- 用于回车选择
					ordinal = entry[5], -- 用于过滤
					display = string.format("%s", entry[3]), -- 显示为 (文件图标+文件名), 光标定位显示路径
				}
			end,
		}),
		previewer = conf.grep_previewer(opts),
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(_, map)
			map("i", "<c-d>", delete_buffers) -- 删除
			map("i", "<s-d>", reverse_delete_buffers) -- 反向删除
			map("i", "<c-o>", open_buffers) -- 批量打开
			return true
		end,
	}):find()
end

M.run = function()
	show_buffers_list({})
end

require("telescope").register_extension({
	exports = {
		bufferslist = M.run,
	},
})

return M
