local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local action_utils = require "telescope.actions.utils"
local make_entry = require "telescope.make_entry"
local filter = vim.tbl_filter
local notify = require('notify')
local conf = require("telescope.config").values

local function set_buffer(buffers)
	local tabnr = vim.api.nvim_get_current_tabpage()
	local winnrs = vim.api.nvim_tabpage_list_wins(tabnr)
	for i, win in ipairs(winnrs) do
		vim.api.nvim_win_set_buf(win, buffers[i])
	end
end

local function open_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local buf_entries = {}
	action_utils.map_entries(prompt_bufnr, function(entry, _, _)
		if current_picker._multi:is_selected(entry) then
			table.insert(buf_entries, entry.bufnr)
		end
	end)

	actions.close(prompt_bufnr)

	vim.api.nvim_set_current_buf(buf_entries[1])
	if #buf_entries == 1 then
		return
	end

	-- 创建新tab
	vim.cmd("tab split")
	local curwin = vim.api.nvim_get_current_win()

	if #buf_entries == 2 then
		-- 垂直窗口
		vim.cmd("vsp")
		set_buffer(buf_entries)
		return
	end

	if #buf_entries == 3 then
		-- 垂直窗口
		vim.cmd("vsp")
		vim.cmd("vsp")
		set_buffer(buf_entries)
		return
	end

	if #buf_entries == 4 then
		vim.cmd("vsp")
		vim.cmd("sp")
		vim.api.nvim_set_current_win(curwin)
		vim.cmd("sp")
		set_buffer(buf_entries)
		return
	end

	if #buf_entries == 5 then
		vim.cmd("vsp")
		vim.cmd("sp")
		vim.api.nvim_set_current_win(curwin)
		vim.cmd("sp")
		vim.cmd("sp")
		set_buffer(buf_entries)
		return
	end

	if #buf_entries >= 6 then
		vim.cmd("vsp")
		vim.cmd("sp")
		vim.api.nvim_set_current_win(curwin)
		vim.cmd("sp")
		vim.cmd("vsp")
		vim.api.nvim_set_current_win(curwin)
		vim.cmd("vsp")
		set_buffer(buf_entries)
		return
	end
end

local function delete_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local multi = false
	action_utils.map_entries(prompt_bufnr, function(entry, _, _)
		if current_picker._multi:is_selected(entry) then
			multi = true
			if entry.bufnr~=current_picker.source_bufnr then
				vim.api.nvim_buf_delete(entry.bufnr, { force = 0 })
			end
		end
	end)
	local entry = action_state.get_selected_entry()
	if multi == false and entry.bufnr~=current_picker.source_bufnr then
		vim.api.nvim_buf_delete(entry.bufnr, { force = 0 })
	end
	actions.close(prompt_bufnr)
end

local function reverse_delete_buffers(prompt_bufnr)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	local multi = false
	local selected_entry = action_state.get_selected_entry()
	local save_bufs = {}
	table.insert(save_bufs, current_picker.source_bufnr)

	action_utils.map_entries(prompt_bufnr, function(entry, _, _)
		if current_picker._multi:is_selected(entry) then
			multi = true
			table.insert(save_bufs, entry.bufnr)
		end
	end)

	local entry = action_state.get_selected_entry()
	if multi == false  then
		table.insert(save_bufs, entry.bufnr)
	end

	action_utils.map_entries(prompt_bufnr, function(entry, _, _)
		if not vim.tbl_contains(save_bufs, entry.bufnr) then
			vim.api.nvim_buf_delete(entry.bufnr, { force = 0 })
		end
	end)

	actions.close(prompt_bufnr)
end

-- Makes sure aliased options are set correctly
local function apply_cwd_only_aliases(opts)
	local has_cwd_only = opts.cwd_only ~= nil
	local has_only_cwd = opts.only_cwd ~= nil

	if has_only_cwd and not has_cwd_only then
		-- Internally, use cwd_only
		opts.cwd_only = opts.only_cwd
		opts.only_cwd = nil
	end

	return opts
end

local show_buffers_list = function(opts)
	opts = opts or {}
	opts = apply_cwd_only_aliases(opts)
	local current_bufnr = vim.api.nvim_get_current_buf()
	local bufnrs = filter(function(b)
		if 1 ~= vim.fn.buflisted(b) then
			return false
		end
		-- only hide unloaded buffers if opts.show_all_buffers is false, keep them listed if true or nil
		if opts.show_all_buffers == false and not vim.api.nvim_buf_is_loaded(b) then
			return false
		end
		if opts.ignore_current_buffer and b == current_bufnr then
			return false
		end
		if opts.cwd_only and not string.find(vim.api.nvim_buf_get_name(b), vim.loop.cwd(), 1, true) then
			return false
		end
		return true
	end, vim.api.nvim_list_bufs())
	if not next(bufnrs) then
		return
	end
	if opts.sort_mru then
		table.sort(bufnrs, function(a, b)
			return vim.fn.getbufinfo(a)[1].lastused > vim.fn.getbufinfo(b)[1].lastused
		end)
	end

	local buffers = {}
	local default_selection_idx = 1
	for _, bufnr in ipairs(bufnrs) do
		local flag = bufnr == vim.fn.bufnr "" and "%" or (bufnr == vim.fn.bufnr "#" and "#" or " ")

		if opts.sort_lastused and not opts.ignore_current_buffer and flag == "#" then
			default_selection_idx = 2
		end

		local element = {
			bufnr = bufnr,
			flag = flag,
			info = vim.fn.getbufinfo(bufnr)[1],
		}

		if opts.sort_lastused and (flag == "#" or flag == "%") then
			local idx = ((buffers[1] ~= nil and buffers[1].flag == "%") and 2 or 1)
			table.insert(buffers, idx, element)
		else
			table.insert(buffers, element)
		end
	end

	if not opts.bufnr_width then
		local max_bufnr = math.max(unpack(bufnrs))
		opts.bufnr_width = #tostring(max_bufnr)
	end

	local picker = pickers.new(opts, {
			prompt_title = "Buffers",
			finder = finders.new_table {
				results = buffers,
				entry_maker = opts.entry_maker or make_entry.gen_from_buffer(opts),
			},
			previewer = conf.grep_previewer(opts),
			sorter = conf.generic_sorter(opts),
			default_selection_index = default_selection_idx,
			attach_mappings = function(_, map)
				map("i", "<c-d>", delete_buffers) -- 删除
				map("i", "<s-d>", reverse_delete_buffers) -- 反向删除
				map("i", "<c-o>", open_buffers) -- 批量打开
				return true
			end,
		})
	picker.source_bufnr = current_bufnr
	picker:find()
end

M.run = function(opt)
	show_buffers_list(opt)
end

--require("telescope").register_extension({
--exports = {
--bufferslist = M.run,
--},
--})

return M
