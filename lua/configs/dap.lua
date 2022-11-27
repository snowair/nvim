local M = {}
function M.config()
	local dap = require('dap')

	-- 自定义断点图标
	vim.fn.sign_define('DapBreakpoint', { text = '💔', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapBreakpointCondition', { text = '💛', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapLogPoint', { text = '🤍', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapBreakpointRejected', { text = '🖐️', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' }) -- hint,info,warn,error

	-- 本地delve服务配置,调试时根据此配置自动启动dlv进程,attach到go进程,连接到dlv
	dap.adapters.localDlv = {
		type = 'server',
		port = '${port}',
		executable = {
			command = 'dlv',
			args = { 'dap', '-l', '127.0.0.1:${port}' },
		}
	}

	dap.adapters.remoteDlv = {
		type = "executable";
		command = "node";
		args = { os.getenv("HOME") .. "/vscode-go/dist/debugAdapter.js" };
	}

	-- golang配置
	-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
	dap.configurations.go = {
		{
			name = "Debug",
			type = "localDlv", -- 使用哪个 dap.adapters 中的哪个配置
			request = "launch", -- "launch" 代表主动拉起dlv进程并attach
			program = "${file}" -- 被替换为被调试的go进程文件绝对路径
		},
		{
			name = "Debug test", -- configuration for debugging test files
			type = "localDlv",
			request = "launch",
			mode = "test",
			program = "${file}"
		},
		-- works with go.mod packages and sub packages
		{
			name = "Debug test (go.mod)",
			type = "localDlv",
			request = "launch",
			mode = "test",
			program = "./${relativeFileDirname}"
		},
		-- 远程
		{
			type = "remoteDlv";
			request = "attach";
			mode = "remote";
			name = "Remote Attached Debugger";
			port = 2345;
			host = '127.0.0.1';
			cwd = vim.loop.cwd();
		},
	}
end

return M
