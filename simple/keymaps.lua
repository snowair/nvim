-- 重要 leader 键
vim.g.mapleader = ';;'

-- F1~F12
-- t: terminal
vim.keymap.set({ 'n', 'i' }, '<s-F1>', '<Esc>:NvimTreeToggle<cr>')
vim.keymap.set({ 'n', 'i' }, '<F13>', '<Esc>:NvimTreeToggle<cr>')

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
