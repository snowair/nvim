local M = {}
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require "telescope.make_entry"

local Job = require 'plenary.job'
local notify = require 'notify'
local stateCache = {
  stateColor = "white",
  state = '  ',
  bgcolor = "",
  fgcolor = "orange",
  staged = 0,
  unstaged = 0,
  unmerged = 0,
  untracked = 0,
  status = 0,
  modified_list = {},
}

local function checkLocalCommit(info, cwd)
  if info == nil then
    return
  end
  Job:new({
    command = 'git',
    args = { 'rev-parse', '--short', 'HEAD' },
    cwd = cwd,
    env = { PATH = vim.env.PATH },
    on_exit = function(j, _)
      if j.code == 0 then
        if #j._stdout_results == 1 then
          local current_commit = j._stdout_results[1]
          local pos = string.find(info, current_commit)
          if pos ~= nil and pos >= 1 then
            stateCache.state = ' '
            stateCache.stateColor = "red"
          else
            stateCache.state = "  "
            stateCache.stateColor = "red"
          end
        end
      end
    end,
  }):start()
end

local function getForwardNum(cwd)
  Job:new({
    command = 'git',
    args = { 'rev-list', 'HEAD', '--not', '--remotes' },
    cwd = cwd,
    env = { PATH = vim.env.PATH },
    on_exit = function(j, _)
      if j.code == 0 then
        local forward = #j._stdout_results
        if forward > 0 then
          stateCache.state = "  (" .. tonumber(forward) .. ")"
          stateCache.stateColor = "orange"
        else
          stateCache.state = "  "
          stateCache.stateColor = "#67aa02"
        end
      end
    end,
  }):start()
end

local function setStatus(cwd)
  Job:new({
    command = 'git',
    args = { 'status', '--short' },
    cwd = cwd,
    env = { PATH = vim.env.PATH },
    on_exit = function(j, _)
      if j.code == 0 then
        stateCache.status = 1
        local unmerged = 0
        local unstaged = 0
        local untracked = 0
        local staged = 0
        for _, line in ipairs(j._stdout_results) do
          local a = string.sub(line, 1, 1)
          local b = string.sub(line, 2, 2)
          local filepath = string.sub(line, 4)
          -- 将filepath 转为绝对路径
          filepath = cwd .. "/" .. filepath

          if a == "?" and b == "?" then
            untracked = 1 + untracked
            table.insert(stateCache.modified_list, filepath)
          elseif a ~= " " and b ~= " " then
            unmerged = 1 + unmerged
            table.insert(stateCache.modified_list, filepath)
          elseif a ~= " " and b == " " then
            staged = 1 + staged
            table.insert(stateCache.modified_list, filepath)
          elseif a == " " and b ~= " " then
            unstaged = 1 + unstaged
            table.insert(stateCache.modified_list, filepath)
          end
        end
        stateCache.unmerged  = unmerged
        stateCache.staged    = staged
        stateCache.unstaged  = unstaged
        stateCache.untracked = untracked
      else
        stateCache.status = 0
      end
    end,
  }):start()
end

local timer = vim.loop.new_timer()
local runing = false
M.gitStatusTaskFn = function()
  if runing then
    return
  end
  runing = true
  local cwd = vim.loop.cwd()
  Job:new({
    command = 'git',
    args = { 'fetch', '--dry-run' },
    cwd = cwd,
    env = { PATH = vim.env.PATH },
    on_exit = function(j, _)
      if j.code == 0 then
        if #j._stderr_results == 0 then
          -- 没有远程更新
          local function tmp()
            getForwardNum(cwd)
          end

          vim.schedule_wrap(tmp)()
        else
          -- 有远程更新
          local function tmp()
            checkLocalCommit(j._stderr_results[2], cwd)
          end

          vim.schedule_wrap(tmp)()
        end
      else
        stateCache.state = ""
      end
      runing = false
    end,
  }):start()

  setStatus(cwd)
end

timer:start(0, 10000, vim.schedule_wrap(M.gitStatusTaskFn))

local function update_branch_status()
  return stateCache.state
end

local function update_index_status()
  if stateCache.status == 0 then
    stateCache.bgcolor = ""
    return ""
  end
  local result = ""
  if stateCache.unstaged > 0 then
    result = string.format("UnSta(%d)", stateCache.unstaged)
  end

  if stateCache.unmerged > 0 then
    result = result .. string.format(" UnMer(%d)", stateCache.unmerged)
  end

  if stateCache.untracked > 0 then
    result = result .. string.format(" UnTra(%d)", stateCache.untracked)
  end

  result = vim.trim(result)

  if stateCache.staged > 0 and result == "" then
    stateCache.bgcolor = "#cb015c"
    return string.format("staged(%d)", stateCache.staged)
  elseif stateCache.staged == 0 and result == "" then
    stateCache.bgcolor = "grey"
    return string.format("clean")
  else
    stateCache.bgcolor = "#625bcb"
    return result
  end
end

M.config = function()
  local function nvimtree_branch()
    local b = require 'lualine.components.branch.git_branch'.get_branch()
    if b == "" then
      return ""
    end
    return " " .. b
  end

  local NvimTree = {
    filetypes = { 'NvimTree' },
    sections = {
      lualine_a = {
        {
          'branch',
          color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
          separator = { right = '' },
          left_padding = 2,
        },
      },
    },
    inactive_sections = {
      lualine_a = {
        {
          nvimtree_branch,
          color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
          separator = { right = '' },
          left_padding = 2,
        }
      }
    }
  }

  --  lualine theme设置
  require('lualine').setup {
    options = {
      component_separators = '|',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_b = {
        {
          'branch',
          color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
        },
        'diff',
        {
          'filename',
          file_status = true, -- Displays file status (readonly status, modified status)
          path = 1,           -- 0: Just the filename
          -- 1: Relative path
          -- 2: Absolute path
          -- 3: Absolute path, with tilde as the home directory
          shorting_target = 40, -- Shortens path to leave 40 spaces in the window
          -- for other components. (terrible name, any suggestions?)
          symbols = {
            modified = '[+]',      -- Text to show when the file is modified.
            readonly = '[RO]',     -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
          }
        },
        {
          'diagnostics',
          separator = { left = ' | ', right = '' },
        },
      },
      lualine_c = {
        {
          update_branch_status, -- 刷新本地分支与远程分支的对比状态
          separator = { right = '' },
          color = function()
            return { bg = stateCache.stateColor, gui = 'bold' }
          end,
        },
        {
          update_index_status, -- 刷新本地文件状态
          separator = { right = '' },
          color = function()
            return { fg = stateCache.fgcolor, bg = stateCache.bgcolor, gui = 'bold', }
          end,
        },
      },
      lualine_x = { 'fileformat', },
      lualine_y = { 'filetype', 'encoding', 'filesize', 'location' },
      lualine_z = {
        { 'progress', separator = { right = '' }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = {
        {
          'filename', -- TODO: 样式很不明显,改进一下
          path = 1
        },
      },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = { 'quickfix', 'chadtree', 'toggleterm', 'nvim-dap-ui', 'mundo', NvimTree }
  }
end

M.modifiedList = function(opts)
  opts = opts or {};
  local buffers = {}
  local bufnrs = {}
  for _, buf in ipairs(vim.fn.getbufinfo()) do
    local bufnr = buf.bufnr
    local flag = bufnr == vim.fn.bufnr "" and "%" or (bufnr == vim.fn.bufnr "#" and "#" or " ")
    local element = {
      bufnr = buf.bufnr,
      flag = flag,
      info = buf,
    }

    -- 判断 buf.name 存在于 stateCache.modified_list
    if vim.tbl_contains(stateCache.modified_list, buf.name) then
      table.insert(buffers, element)
      table.insert(bufnrs, buf.bufnr)
    end
  end

  if not opts.bufnr_width and #buffers > 0 then
    local max_bufnr = math.max(unpack(bufnrs))
    opts.bufnr_width = #tostring(max_bufnr)
  end

  local picker = pickers.new(opts, {
    prompt_title = "Modified List",
    finder = finders.new_table {
      results = buffers,
      entry_maker = make_entry.gen_from_buffer(opts),
    },
    previewer = conf.grep_previewer(opts),
    sorter = conf.generic_sorter(opts),
    default_selection_index = 1,
  })
  picker:find()
end

return M
