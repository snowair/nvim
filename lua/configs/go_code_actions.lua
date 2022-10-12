local null_ls = require("null-ls")

local time_parser_pattern = {
	method = null_ls.methods.CODE_ACTION, -- 声明定义的是code action
	filetypes = { "go" }, -- 声明生效的文件类型
	generator = {
		--[[
		--context 对象示例
{
  bufname = "/private/tmp/out.rb",
  bufnr = 1,
  ft = "ruby",
  client_id = 1,
  col = 16, -- 光标位于第几列的后买
  row = 1, -- 光标位于第几行
  content = { 'puts "Hello world"', "" }, -- buffer里的完整内容, 每行内容一个元素
  lsp_method = "textDocument/codeAction",
  method = "NULL_LS_CODE_ACTION",
  range = {
    col = 17, -- 光标位于第几列
    row = 1, -- 光标位于第几行
    end_col = 17,
    end_row = 1
  }
}

-- 返回对象
return {
            {
                title = "🥶Add frozen string literal comment",
                action = function()
                    lines = {frozen_string_literal_comment, "", first_line}

                    vim.api
                        .nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
                end
            }
        }
		--]]
		fn = function(context)
			-- interface
			local m = string.match(context.content[context.row], '^%s*type%s%w+%sinterface')
			if m ~= nil then
				return {
					{
						title = "GoCmt",
						action = function()
							vim.cmd 'GoCmt'
						end
					}
				}

			end
			-- struct
			m = string.match(context.content[context.row], '^%s*type%s%w+%sstruct')
			if m ~= nil then
				return {
					{
						title = "GoCmt",
						action = function()
							vim.cmd 'GoCmt'
						end
					},
					{
						title = "GoAddTag json",
						action = function()
							vim.cmd 'GoAddTag json'
						end
					},
					{
						title = "GoAddTag json,form",
						action = function()
							vim.cmd 'GoAddTag json,form'
						end
					},
					{
						title = "GoClearTag",
						action = function()
							vim.cmd 'GoClearTag'
						end
					},
					{
						title = "GoImpl interface",
						action = function()
							vim.cmd 'GoImpl'
						end
					},
				}
			end

			-- function/method/const/var
			local pattern = {
				'%s*func%s+%a[%w_]*', '%s*func%s+%(.+%)%s*%a[%w_]*', '^%s*const%s+%a[%w_]*', '^%s*var%s+%a[%w_]*', '^%s*%a[%w_]*%s*',
			}

			for _, p in pairs(pattern) do
				m = string.match(context.content[context.row], p)
				if m ~= nil then
					return {
						{
							title = "GoCmt",
							action = function()
								vim.cmd 'GoCmt'
							end
						}
					}
				end

			end

		end
	}
}
null_ls.register(time_parser_pattern)
