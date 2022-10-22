local M = {}
function M.config()

	local aleph = require("aleph")
	local dashboard = require("aleph.themes.dashboard")

	--- @param sc string
	--- @param txt string
	--- @param keybind string optional
	local function button(sc, txt, keybind)
		local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 50,
			align_shortcut = "right",
			hl_shortcut = "Keyword",
		}

		if keybind then
			opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } }
		end

		local function on_press()
			local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "normal", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	dashboard.opts.layout[4].val = {
		button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
		button("h", "  > History Files", ":Telescope oldfiles<CR>"),
		button("f", "  > Find file", ":Telescope find_files<CR>"),
		button("p", "  > Project file", ":Telescope projects<CR>"),
		button("l", "★  > Load Session", ":SessionManager load_session<CR>"),
		button("n", "  > NVim Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
		button("q", "  > Quit NVIM", ":qa<CR>"),
	}
	aleph.setup(dashboard.opts)
	-- Disable folding on aleph buffer:
	vim.cmd("autocmd FileType aleph setlocal nofoldenable")
end

return M
