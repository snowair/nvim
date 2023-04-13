local M = {}
local api = require('nvim-tree.api')
function M.config()
  -- nvim-tree config
  require 'nvim-tree'.setup {
    disable_netrw        = true,
    hijack_netrw         = true,
    auto_reload_on_write = true,
    open_on_tab          = false,
    hijack_cursor        = false,
    --根据 working dir自动同步tree的root; 根据tree root的变化自动修改cwd. 应该设为true, 修改tree root的方式.
    -- 建议使用一全局变量保存项目根目录
    sync_root_with_cwd   = false,
    -- 删掉一些影响操作默认key绑定
    remove_keymaps       = { "<C-e>", "<C-r>", "s", "S", "O", },
    diagnostics          = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      }
    },
    update_focused_file  = {
      -- 启用后, 如果当前文件位于tree的子孙级目录, tree会根据当前文件, 自动展开tree并定位到tree的对应位置. 可以使用 :NvimTreeFindFile 手动定位
      enable      = true,
      -- 仅当enable = true时有效. 如果当前文件位于tree的root目录之外, 则自动切换工作目录到这个文件所在目录
      -- 应该设置为false, 因为 :Telescope lsp_definitions 是不能搜索工作目录之外的定义
      update_cwd  = false,
      ignore_list = {}
    },
    system_open          = {
      cmd  = nil,
      args = {}
    },
    filters              = {
      dotfiles = true, -- 是否屏蔽隐藏文件
      custom = {
        ".DS_Store",
        ".idea"
      }
    },
    git                  = {
      enable = true,
      ignore = true,
      timeout = 500,
    },
    view                 = {
      width            = 30,
      hide_root_folder = false,
      side             = 'left',
      mappings         = {
        custom_only = false,
        list = {}
      },
      number           = false,
      relativenumber   = true,
      signcolumn       = "yes",
    },
    trash                = {
      cmd = "trash",
      require_confirm = true
    },
    actions              = {
      change_dir = {
        global = false,
      },
      open_file = {
        quit_on_open = false,
      }
    },

    -- git扩展
    on_attach            = function(bufnr)
      local opts = function(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end
      local inject_node = require("nvim-tree.utils").inject_node
      -- BEGIN_DEFAULT_ON_ATTACH
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
      vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
      vim.keymap.set('n', '<C-r>', '', { buffer = bufnr })
      vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
      vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
      vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
      vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
      vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
      vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
      vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
      vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
      vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
      vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
      vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
      vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
      vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
      vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
      vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
      vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
      vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
      vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
      vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
      vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'O', '', { buffer = bufnr })
      vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 's', '', { buffer = bufnr })
      vim.keymap.set('n', 'S', '', { buffer = bufnr })
      vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
      vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
      vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
      vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
      -- END_DEFAULT_ON_ATTACH


      -- history
      vim.keymap.set(
        "n",
        "<c-g>",
        inject_node(function(node)
          if node and node.absolute_path then
            vim.cmd(string.format('DiffviewFileHistory %s', node.absolute_path))
          else
            vim.notify(vim.inspect(node))
          end
        end),
        { buffer = bufnr, noremap = true }
      )
    end
  }
  vim.cmd([[
    let g:nvim_tree_icons = {
        \ 'default': '',
        \ 'symlink': '',
        \ 'git': {
        \   'unstaged': "✗",
        \   'staged': "✓",
        \   'unmerged': "",
        \   'renamed': "➜",
        \   'untracked': "★",
        \   'deleted': "",
        \   'ignored': "◌"
        \   },
        \ 'folder': {
        \   'arrow_open': "",
        \   'arrow_closed': "",
        \   'default': "",
        \   'open': "",
        \   'empty': "",
        \   'empty_open': "",
        \   'symlink': "",
        \   'symlink_open': "",
        \   }
        \ }
    ]])
end

return M
