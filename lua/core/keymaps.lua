-- 重要 leader 键
vim.g.mapleader = ';;'

-- F1~F12
-- t: terminal
vim.keymap.set({ 'n', 'i' }, '<s-F1>', '<Esc>:NvimTreeToggle<cr>')
vim.keymap.set({ 'n', 'i' }, '<F13>', '<Esc>:NvimTreeToggle<cr>')
vim.keymap.set('n', '<F2>', vim.diagnostic.goto_next)
vim.keymap.set('n', '<s-F2>', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<F14>', vim.diagnostic.goto_prev)

-- terminal 模式
local function floatTerm()
  vim.cmd("silent! noa wall")
  vim.cmd("FloatermToggle")
end
vim.keymap.set('n', '<s-f3>', floatTerm)
vim.keymap.set('n', '<f15>', floatTerm)
vim.keymap.set('t', '<s-f3>', '<c-\\><c-n>:FloatermToggle<return>')
vim.keymap.set('t', '<f15>', '<c-\\><c-n>:FloatermToggle<return>')
vim.keymap.set('t', '<f27>', '<c-\\><c-n>:FloatermNext<return>')
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- NeoGit
local function neogit()
  vim.cmd("silent! noa wall")
  vim.cmd("Neogit")
end
vim.keymap.set('n', '<s-f4>', neogit)
vim.keymap.set('n', '<f16>', neogit)

vim.keymap.set('n', '<s-f5>', function() require 'telescope.builtin'.lsp_dynamic_workspace_symbols() end)
vim.keymap.set('n', '<F17>', function() require 'telescope.builtin'.lsp_dynamic_workspace_symbols() end)
vim.keymap.set('n', '<c-f5>', function() require 'telescope.builtin'.lsp_document_symbols() end) -- <c-l>弹出类型过滤以后，<c-p> , <c-n> 进行选择
vim.keymap.set('n', '<F29>', function() require 'telescope.builtin'.lsp_document_symbols() end) -- <c-l>弹出类型过滤以后，<c-p> , <c-n> 进行选择

vim.keymap.set('n', '<s-f6>', vim.lsp.buf.rename) -- refactor: 重命名
vim.keymap.set('n', '<F18>', vim.lsp.buf.rename) -- refactor: 重命名
vim.keymap.set('n', '<a-enter>', vim.lsp.buf.code_action) -- 弹出select列表，选择可以对光标处代码执行的所有操作: 例如忽略诊断错误; 交换函数参数; LSP 提供的refactor或quickfix
vim.keymap.set('n', '<d-enter>', vim.lsp.buf.code_action) -- 弹出select列表，选择可以对光标处代码执行的所有操作: 例如忽略诊断错误; 交换函数参数; LSP 提供的refactor或quickfix
vim.keymap.set('n', '<m-enter>', vim.lsp.buf.code_action) -- 弹出select列表，选择可以对光标处代码执行的所有操作: 例如忽略诊断错误; 交换函数参数; LSP 提供的refactor或quickfix
vim.keymap.set('n', '<m-a>', vim.lsp.buf.code_action) -- 弹出select列表，选择可以对光标处代码执行的所有操作: 例如忽略诊断错误; 交换函数参数; LSP 提供的refactor或quickfix
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action) -- 弹出select列表，选择可以对光标处代码执行的所有操作: 例如忽略诊断错误; 交换函数参数; LSP 提供的refactor或quickfix
vim.keymap.set('n', '<a-h>', vim.lsp.buf.hover) -- 悬浮窗显示光标悬停元素的文档(方法)或定义(变量), 连按两次，可以进入悬浮框窗口。
vim.keymap.set('n', '<d-h>', vim.lsp.buf.hover) -- 悬浮窗显示光标悬停元素的文档(方法)或定义(变量), 连按两次，可以进入悬浮框窗口。
vim.keymap.set('n', '<m-h>', vim.lsp.buf.hover) -- 悬浮窗显示光标悬停元素的文档(方法)或定义(变量), 连按两次，可以进入悬浮框窗口。

-- 仅提供基本的断点设置和清除键，调试过程控制由语言支持插件，例如 go.nvim 提供的相关命令
local dap = require("dap")
vim.keymap.set({ 'n' }, '<c-F7>', function() dap.toggle_breakpoint() end)
vim.keymap.set({ 'n' }, '<s-F7>', function() dap.clear_breakpoints() end)
vim.keymap.set({ 'n' }, '<F31>', function() dap.toggle_breakpoint() end)
vim.keymap.set({ 'n' }, '<F19>', function() dap.clear_breakpoints() end)

-- 加载session
local function load_session()
  vim.cmd("silent! noa wall")
  if vim.env.SESSION_DIR ~= nil then
    vim.fn.chdir(vim.env.SESSION_DIR)
  end
  vim.cmd('SessionManager load_session')
end
vim.keymap.set({ 'n', 'i' }, '<c-F8>', load_session)
vim.keymap.set({ 'n', 'i' }, '<F32>', load_session)

-- telescope
local function get_dirs()
  local ssdir = vim.env.SESSION_DIR
  local dirlist = vim.g.dirChangeHistory
  local cwd = vim.loop.cwd()
  if dirlist ~= nil and #dirlist >= 1 then
    -- cdlist有可能不含有当前cwd,所以需要加入
    local cwd_exsist = false
    for _, v in pairs(dirlist) do
      if v == cwd then
        cwd_exsist = true
      end
    end

    if cwd_exsist == false then
      table.insert(dirlist, cwd)
    end

    local dirlist_copy = {}
    local inited = false
    for _, v in pairs(dirlist) do
      if inited == false then
        table.insert(dirlist_copy, v)
        inited = true
      else
        local breaked = false
        for iCopy, copyVal in pairs(dirlist_copy) do
          local start, _ = string.find(copyVal, v)
          if start == 1 then -- v更短
            table.insert(dirlist_copy, v)
            table.remove(dirlist_copy, iCopy)
            breaked = true
            break
          end

          local start2, _ = string.find(v, copyVal)
          if start2 == 1 then -- copyVal 更短
            breaked = true
            break
          end
        end

        if breaked == false then
          table.insert(dirlist_copy, v)
        end
      end
    end
    return dirlist_copy
  else
    if ssdir ~= nil then
      return ssdir
    else
      return cwd
    end
  end
end

-- 在cdlist中搜文件内容
local function live_grep_in_cdlist()
  require 'telescope.builtin'.live_grep({ search_dirs = get_dirs() })
end
vim.keymap.set({ 'n', 'i' }, '<c-F9>', live_grep_in_cdlist)
vim.keymap.set({ 'n', 'i' }, '<F33>', live_grep_in_cdlist)

-- 在cdlist中搜文件
local function find_files_in_cdlist()
  require 'telescope.builtin'.find_files({ search_dirs = get_dirs() })
end
vim.keymap.set({ 'n', 'i' }, '<c-F10>', find_files_in_cdlist)
vim.keymap.set({ 'n', 'i' }, '<F34>', find_files_in_cdlist)

-- 在session dir中搜文件
local function find_files_in_session_dir()
  local ssdir = vim.env.SESSION_DIR
  if ssdir ~= nil then
    require 'telescope.builtin'.find_files({ search_dirs = { ssdir } })
  else
    require 'telescope.builtin'.find_files()
  end
end
vim.keymap.set({ 'n', 'i' }, '<c-F11>', find_files_in_session_dir)
vim.keymap.set({ 'n', 'i' }, '<F35>', find_files_in_session_dir)

-- 在session dir中搜文件内容
local function live_grep_in_session_dir()
  local ssdir = vim.env.SESSION_DIR
  if ssdir ~= nil then
    require 'telescope.builtin'.live_grep({ search_dirs = { ssdir } })
  else
    require 'telescope.builtin'.live_grep()
  end
end
vim.keymap.set({ 'n', 'i' }, '<s-F11>', live_grep_in_session_dir)
vim.keymap.set({ 'n', 'i' }, '<F23>', live_grep_in_session_dir)

vim.keymap.set({ 'n', 'i' }, '<c-F12>', function() require 'telescope.builtin'.buffers({}) end) -- 搜buffer
vim.keymap.set({ 'n', 'i' }, '<F36>', function() require 'telescope.builtin'.buffers({}) end) -- 搜buffer
vim.keymap.set({ 'n' }, '<c-space>', function()
  vim.cmd("silent! noa wall")
  require 'configs.bufferlist'.run({ only_cwd = true })
end)


-- 剪贴板操作
vim.keymap.set('v', '<C-Insert>', '"+y')
vim.keymap.set('v', '<C-Y>', '"+y') -- visual模式复制
vim.keymap.set('v', '<C-Del>', '"+x')
vim.keymap.set('v', '<S-Insert>', '"+p')
vim.keymap.set('v', '<S-Help>', '"+p')
vim.keymap.set({ 'n', 'i' }, '<S-Insert>', '<esc>"+p')
vim.keymap.set({ 'n', 'i' }, '<S-Help>', '<esc>"+p')
-- command+c/v/x
vim.keymap.set('v', '<D-x>', '"+x')
vim.keymap.set('v', '<D-c>', '"+y')
vim.keymap.set({ 'i' }, '<D-v>', '<esc>"+p')
vim.keymap.set({ 'v', 'n' }, '<D-v>', '"+p')


-- 窗口切换
vim.keymap.set({ 'n', 'i' }, '<c-h>', '<ESC><c-w>h')
vim.keymap.set({ 'n', 'i' }, '<c-j>', '<ESC><c-w>j')
vim.keymap.set({ 'n', 'i' }, '<c-k>', '<ESC><c-w>k')
vim.keymap.set({ 'n', 'i' }, '<c-l>', '<ESC><c-w>l')
vim.keymap.set({ 'n', 'i' }, '<leader>fw', '<ESC>:tabnew %<cr>')

-- 默认窗口管理
-- <c-w>o 只保留当前窗口
-- <c-w>v 垂直分割当前窗口
-- <c-w>s 水平分隔当前窗口
-- <c-w>w 窗口之间循环切换

-- l/g/w: language
-- l: general
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float) -- 光标停留在诊断错误处执行，打开悬浮窗显示所有诊断内容
vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist) -- 在loclist 列出诊断错误
vim.keymap.set('n', '<leader>lf', function() require('lspsaga.finder'):lsp_finder() end) -- lsp_finder
vim.keymap.set('n', '<leader>li', function() require('lspsaga.callhierarchy'):send_method(2) end) --  incoming_calls
vim.keymap.set('n', '<leader>lo', function() require('lspsaga.callhierarchy'):send_method(3) end) --  incoming_calls
vim.keymap.set('n', '<leader>ld', function() require('lspsaga.definition'):peek_definition(1) end) -- peek_definition
vim.keymap.set('n', '<leader>lD', function() require('lspsaga.definition'):peek_definition(2) end) -- peek_type_definition

-- g: goto
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration) -- 跳转到变量被声明的地方
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition) -- 跳转到变量的定义
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition) -- 跳转到变量的类型定义
vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation) -- 跳转到接口的实现
vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references) -- 跳转到它的引用
vim.keymap.set('n', '<leader>gu', ':VisitLinkUnderCursor<cr>') -- 打开Url


-- w: workspace
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
vim.keymap.set('n', '<leader>wr', function()
  vim.ui.select(vim.lsp.buf.list_workspace_folders(),
    { prompt = 'Delete LSP Workspace folder:', },
    function(choice)
      vim.lsp.buf.remove_workspace_folder(choice)
    end)
end)
vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end)


-- copilot panel
vim.keymap.set('n', '<leader>cp', ':vert Copilot panel <cr>')
