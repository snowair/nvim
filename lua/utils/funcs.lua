local M = {}

function M.get_dirs()
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


-- 在cdlist中搜文件
function M.find_files_in_cdlist()
  require 'telescope.builtin'.find_files({ search_dirs = M.get_dirs() })
end

-- 在session dir中搜文件
function M.find_files_in_session_dir()
  local ssdir = vim.env.SESSION_DIR
  if ssdir ~= nil then
    require 'telescope.builtin'.find_files({ search_dirs = { ssdir } })
  else
    require 'telescope.builtin'.find_files()
  end
end

-- 在session dir中搜文件内容
function M.live_grep_in_session_dir()
  local ssdir = vim.env.SESSION_DIR
  if ssdir ~= nil then
    require 'telescope.builtin'.live_grep({ search_dirs = { ssdir } })
  else
    require 'telescope.builtin'.live_grep()
  end
end

-- 在cdlist中搜文件内容
function M.live_grep_in_cdlist()
  require 'telescope.builtin'.live_grep({ search_dirs = M.get_dirs() })
end

return M
