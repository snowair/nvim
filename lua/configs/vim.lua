local Job = require 'plenary.job'
local lualine = require('lualine.components.branch.git_branch')

-- 自动保存[No Name]
vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
  callback = function()
    local bt = vim.api.nvim_buf_get_option(0, "buftype")
    local ft = vim.api.nvim_buf_get_option(0, "filetype")
    local bn = string.lower(vim.fn.bufname())
    if bt == "" and ft == "" and
        (bn == "[no name]" or bn == "[new file]" or bn == "") then
      local lines = vim.fn.getline(1, 30)
      -- 判断空buf内容长度
      if lines ~= nil and #table.concat(lines, "") > 50 then
        local tmp_dir = vim.fn.stdpath('data') .. '/tmpfile'
        vim.fn.mkdir(tmp_dir, 'p')
        -- 保存到临时文件
        local filename = tmp_dir .. "/" .. vim.fn.strftime("%Y%m%d_%H%M%S") .. '.txt'
        vim.cmd('sav ' .. filename)
      end
    end
  end
})

-- 退出vim之前, 恢复cwd, 然后保存session
-- 需禁用project等自动探测切换cwd的选项.
vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
  callback = function()
    local sess_dir = vim.env.SESSION_DIR
    if sess_dir ~= nil then
      if vim.fn.exists(':SessionManager') then
        vim.fn.chdir(sess_dir)
        vim.cmd('SessionManager save_current_session')
      end
    end
  end
})

-- 将目录cd历史存起来
vim.api.nvim_create_autocmd({ "DirChangedPre" }, {
  callback = function()
    local dirlist = vim.g.dirChangeHistory
    if dirlist == nil or type(dirlist) ~= "table" then
      dirlist = {}
    end

    local cwd = vim.loop.cwd()
    vim.env.PRE_WORKING_DIR = cwd
    for _, v in pairs(dirlist) do
      if v == cwd then
        return
      end
    end

    if cwd == vim.env.HOME then
      return
    end
    table.insert(dirlist, cwd)
    vim.g.dirChangeHistory = dirlist
  end
})

-- nvim-tree 的 sync_root_with_cwd 自动同步需要关闭, 他是强制根据cwd同步tree root
-- 而我们希望如果新的cwd是上一个cwd的子目录,则不change root
vim.api.nvim_create_autocmd({ "DirChanged" }, {
  callback = function()
    local cwd = vim.loop.cwd()
    local predir = vim.env.PRE_WORKING_DIR

    local start, _ = string.find(cwd, predir, 1, true)
    if predir ~= nil then
      if start == 1 then
        return
      end
    end

    local nt_api = require("nvim-tree.api")
    nt_api.tree.change_root(cwd)
  end
})

-- 实现自定义命令 cdlist
-- 默认为选择并切换
-- 使用delete参数,则进入编辑界面
vim.api.nvim_create_user_command('Cdlist', function(params)
  local dirlist = vim.g.dirChangeHistory
  if dirlist == nil or type(dirlist) ~= "table" then
    vim.cmd('echo "cdlist is empty"')
    return
  end

  if params ~= nil then
    if params.args == "delete" or params.args == "del" or params.args == "d" then
      vim.ui.select(dirlist,
        { prompt = 'Delete a Histroy WD:', },
        function(choice)
          local list = vim.g.dirChangeHistory
          for i, v in pairs(list) do
            if v == choice then
              table.remove(list, i)
              vim.g.dirChangeHistory = list
              return
            end
          end
        end)
    else
      vim.ui.select(dirlist,
        { prompt = 'Change CWD To:', },
        function(choice)
          vim.fn.chdir(choice)
          vim.cmd('echo "CWD : ' .. choice .. '"')
        end)
    end
  else
    vim.cmd('echo "params is nil " ')
  end
end, { nargs = '?', bang = true, })


-- 实现自定义命令 修改guifont
-- 默认为选择并切换
-- 使用delete参数,则进入编辑界面
vim.api.nvim_create_user_command('FontSize', function(params)
  if params ~= nil then
    local size = tonumber(params.args)
    if size ~= nil and vim.opt.guifont ~= nil then
      local newfont = string.gsub(vim.opt.guifont._value, ':h%d+', ':h' .. params.args)
      vim.cmd(string.format('GuiFont! %s', newfont))
    end
  end
end, { nargs = 1, bang = true, })

-- :B -b newbranch
-- :B local_branch
-- :B .						  撤销所有变更
-- :B -- filename			  撤销指定变更
-- :B origin/serverfix        签出远程分支
vim.api.nvim_create_user_command('B', function(params)
  if params ~= nil then
    local branch = params.args
    if branch == "" then
      require 'telescope.builtin'.git_branches()
    else
      local arr = vim.fn.split(branch, "/")
      if #arr == 2 then
        vim.cmd(string.format('!git checkout --track %s', branch))
      else
        vim.cmd(string.format('!git checkout %s', branch))
      end
    end
  end
end, { nargs = "?", bang = true, })

-- :FEtchOrigin
-- :FetchOrigin
local fetchOrigin = function(params)
  if params ~= nil then
    if params.args == "" then
    else
      vim.cmd(string.format('!git checkout -b %s origin/%s', params.args, params.args))
    end
  end
end
vim.api.nvim_create_user_command('FetchOrigin', fetchOrigin, { nargs = "?", bang = true, })
vim.api.nvim_create_user_command('FEtchOrigin', fetchOrigin, { nargs = "?", bang = true, })

-- :Pull
-- :Pull
-- :Pull rebase
-- :Pull merge
local pull = function(params)
  if params ~= nil then
    if params.args == "" then
      vim.cmd('!git pull --ff')
    elseif params.args == "rebase" then
      vim.cmd('!git pull --rebase=true')
    elseif params.args == "merge" then
      vim.cmd('!git pull --rebase=false')
    else
      vim.cmd(string.format('!git pull %s', params.args))
    end
  end
end
vim.api.nvim_create_user_command('Pull', pull, { nargs = "?", bang = true, })
vim.api.nvim_create_user_command('PUll', pull, { nargs = "?", bang = true, })

-- :Push
-- :Push origin branchname
local push = function(params)
  if params ~= nil then
    if params.args == "" then
      vim.cmd(string.format('!git push'))
    else
      vim.cmd(string.format('!git push --set-upstream %s', params.args))
    end
  end
end
vim.api.nvim_create_user_command('Push', push, { nargs = "?", bang = true, })
vim.api.nvim_create_user_command('PUsh', push, { nargs = "?", bang = true, })


-- :Remote
vim.api.nvim_create_user_command('Remote', function(params)
  if params ~= nil then
    if params.args == "" then
      vim.cmd(string.format('!git remote -h'))
    else
      vim.cmd(string.format('!git remote %s', params.args))
    end
  end
end, { nargs = "?", bang = true, })

-- :Merge abort
-- :Merge continue
-- :Merge quit
vim.api.nvim_create_user_command('Merge', function(params)
  if params ~= nil then
    if params.args == "abort" then
      vim.cmd('!git merge --abort')
    elseif params.args == "continue" then
      vim.cmd('!git merge --continue')
    elseif params.args == "quit" then
      vim.cmd('!git merge --quit')
    else
      vim.cmd(string.format('!git merge %s', params.args))
    end
  end
end, { nargs = "?", bang = true, })

-- :Blame 12,12
vim.api.nvim_create_user_command('Blame', function(params)
  if params ~= nil then
    vim.cmd(string.format('!git blame -L %s %%', params.args))
  end
end, { nargs = "?", bang = true, })

-- :Stash
vim.api.nvim_create_user_command('Stash', function(params)
  if params ~= nil then
    if params.args == "" then
      vim.cmd('!git stash')
    else
      vim.cmd(string.format('!git stash %s', params.args))
    end
  end
end, { nargs = "?", bang = true, })

vim.api.nvim_create_user_command('StashPop', function()
  vim.cmd('!git stash pop')
end, { nargs = "?", bang = true, })

-- :Stash apply
vim.api.nvim_create_user_command('StashApply', function()
  vim.cmd('!git stash apply')
end, { nargs = "?", bang = true, })

-- 快速提交
local commit = function(params)
  local files = {
    "\\\n/copilot-summary\\\n"
  }
  if params ~= nil then
    table.insert(files, params.args)
  end
  Job:new({
    command = 'git',
    args = { 'diff', '--staged', '--name-only' },
    cwd = lualine.find_git_dir() .. '/..',
    on_exit = function(j, return_val)
      if return_val == 0 then
        for _, b in pairs(j:result()) do
          table.insert(files, b)
        end
      end
    end,
  }):sync()

  if params ~= nil and params.args ~= "" then
    local cmd = '!git commit -m "' .. table.concat(files, "\\\n") .. '"'
    vim.api.nvim_command(cmd)
  else
    local cmd = '!git commit -m "--other=Modified:' .. table.concat(files, "\\\n") .. '"'
    vim.api.nvim_command(cmd)
  end
end
vim.api.nvim_create_user_command('Commit', commit, { nargs = "?", bang = true, })
vim.api.nvim_create_user_command('COmmit', commit, { nargs = "?", bang = true, })

-- 列出所有被修改过的文件
vim.api.nvim_create_user_command('Modified', function()
  vim.cmd("silent! noa wall")
  require 'configs.lualine'.modifiedList()
end, { nargs = "?", bang = true, })
