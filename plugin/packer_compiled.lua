-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zhuyajie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zhuyajie/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zhuyajie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zhuyajie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zhuyajie/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\2\2´\2\0\0\4\1\n\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0004\3\0\0=\3\a\2-\3\0\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\1¿\15conditions\20filetype_is_not\20filename_is_not\1\0\2\15modifiable\2\vexists\2\vevents\1\4\0\0\16InsertLeave\17TextYankPost\rVimLeave\1\0\5\19debounce_delay\3á\1\22write_all_buffers\1\fenabled\2\20on_off_commands\2 clean_command_line_interval\3\0\nsetup\rautosave\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/qkzk/AutoSave.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["LuaSnip-snippets.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/LuaSnip-snippets.nvim",
    url = "https://github.com/molleweide/LuaSnip-snippets.nvim"
  },
  ["aleph-nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/aleph-nvim",
    url = "https://github.com/leslie255/aleph-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\2∫\1\0\0\4\0\t\0\0226\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\6\0'\3\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\a\0'\3\b\0B\0\4\1K\0\1\0\29:BufferLineCyclePrev<cr>\f<S-Tab>\f<A-Tab>\29:BufferLineCycleNext<cr>\f<C-Tab>\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["close-buffers.vim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/close-buffers.vim",
    url = "https://github.com/Asheq/close-buffers.vim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\2\2´\15\0\0\r\0P\0ˆ\1'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0006\5\5\0'\6\6\0B\5\2\0026\6\5\0'\a\a\0B\6\2\0029\6\b\6\18\a\6\0009\6\t\0065\b8\0004\t\25\0009\n\n\0059\n\v\n5\v\f\0004\f\3\0>\0\1\f>\1\2\f=\f\r\vB\n\2\2>\n\1\t9\n\n\0059\n\v\n5\v\14\0004\f\4\0>\2\1\f>\3\2\f>\4\3\f=\f\r\vB\n\2\2>\n\2\t9\n\n\0059\n\v\n5\v\16\0005\f\15\0=\f\r\vB\n\2\2>\n\3\t9\n\n\0059\n\v\n5\v\18\0005\f\17\0=\f\r\vB\n\2\2>\n\4\t9\n\n\0059\n\v\n5\v\20\0005\f\19\0=\f\r\vB\n\2\2>\n\5\t9\n\n\0059\n\v\n5\v\22\0005\f\21\0=\f\r\vB\n\2\2>\n\6\t9\n\n\0059\n\v\n5\v\24\0005\f\23\0=\f\r\vB\n\2\2>\n\a\t9\n\n\0059\n\v\n5\v\26\0005\f\25\0=\f\r\vB\n\2\2>\n\b\t9\n\n\0059\n\v\n5\v\28\0005\f\27\0=\f\r\vB\n\2\2>\n\t\t9\n\n\0059\n\v\n5\v\30\0005\f\29\0=\f\r\vB\n\2\2>\n\n\t9\n\n\0059\n\v\n5\v \0005\f\31\0=\f\r\vB\n\2\2>\n\v\t9\n\n\0059\n\v\n5\v\"\0005\f!\0=\f\r\vB\n\2\2>\n\f\t9\n\n\0059\n\v\n5\v$\0005\f#\0=\f\r\vB\n\2\2>\n\r\t9\n\n\0059\n\v\n5\v&\0005\f%\0=\f\r\vB\n\2\2>\n\14\t9\n\n\0059\n\v\n5\v(\0005\f'\0=\f\r\vB\n\2\2>\n\15\t9\n\n\0059\n\v\n5\v*\0005\f)\0=\f\r\vB\n\2\2>\n\16\t9\n\n\0059\n\v\n5\v,\0005\f+\0=\f\r\vB\n\2\2>\n\17\t9\n\n\0059\n\v\n5\v.\0005\f-\0=\f\r\vB\n\2\2>\n\18\t9\n/\0059\n0\n9\n1\n>\n\19\t9\n/\0059\n0\n9\n2\n>\n\20\t9\n3\0059\n0\n9\n4\n>\n\21\t9\n\n\0059\n0\n9\n5\n>\n\22\t9\n\n\0059\n0\n9\n6\n>\n\23\t9\n\n\0059\n0\n9\n7\n>\n\24\t=\t9\bB\6\3\0016\6:\0009\6;\0069\6<\6'\a=\0'\b>\0006\t\5\0'\n?\0B\t\2\0029\t@\tB\t\1\0025\nA\0B\6\5\0016\6:\0009\6;\0069\6<\6'\a=\0'\bB\0006\t\5\0'\n?\0B\t\2\0029\tC\tB\t\1\0025\nD\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\b>\0006\t\5\0'\n?\0B\t\2\0029\tF\tB\t\1\0025\nG\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bB\0006\t\5\0'\n?\0B\t\2\0029\tH\tB\t\1\0025\nI\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bJ\0006\t\5\0'\n?\0B\t\2\0029\tK\tB\t\1\0025\nL\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bM\0006\t\5\0'\n?\0B\t\2\0029\tN\tB\t\1\0025\nO\0B\6\5\1K\0\1\0\1\0\1\fnoremap\2\16dec_gvisual\vg<C-x>\1\0\1\fnoremap\2\16inc_gvisual\vg<C-a>\1\0\1\fnoremap\2\15dec_visual\1\0\1\fnoremap\2\15inc_visual\6v\1\0\1\fnoremap\2\15dec_normal\n<C-x>\1\0\1\fnoremap\2\15inc_normal\rdial.map\n<C-a>\6n\20nvim_set_keymap\bapi\bvim\fdefault\1\0\0\nAlpha\nalpha\tbool\r%Y/%m/%d\tdate\bhex\fdecimal\nalias\finteger\1\0\2\vcyclic\2\tword\2\1\5\0\0\nError\tWarn\tInfo\nDebug\1\0\2\vcyclic\2\tword\2\1\3\0\0\bGET\tPOST\1\0\2\vcyclic\2\tword\1\1\3\0\0\f[]byte(\fstring(\1\0\2\vcyclic\2\tword\2\1\4\0\0\6\"\t‚Äú \b‚Äù\1\0\2\vcyclic\2\tword\2\1\4\0\0\6.\b„ÄÇ\bÔºé\1\0\2\vcyclic\2\tword\2\1\3\0\0\6,\bÔºå\1\0\2\vcyclic\2\tword\2\1\3\0\0\6+\6-\1\0\2\vcyclic\2\tword\2\1\3\0\0\fenabled\rdisabled\1\0\2\vcyclic\2\tword\2\1\3\0\0\venable\fdisable\1\0\2\vcyclic\2\tword\2\1\3\0\0\bmin\bmax\1\0\2\vcyclic\2\tword\2\1\3\0\0\tdesc\basc\1\0\2\vcyclic\2\tword\2\1\3\0\0\fsuccess\nerror\1\0\2\vcyclic\2\tword\2\1\4\0\0\tuint\vuint32\vuint64\1\0\2\vcyclic\2\tword\2\1\4\0\0\bint\nint32\nint64\1\0\2\vcyclic\2\tword\1\1\3\0\0\a&&\a||\1\0\2\vcyclic\2\tword\2\1\3\0\0\band\aor\1\0\2\vcyclic\2\tword\1\relements\1\0\2\vcyclic\2\tword\2\bnew\rconstant\19register_group\faugends\16dial.config\16dial.augend\frequire\r15:04:05\r20060102\0152006-01-02\01920060102150405\0242006-01-02 15:04:05\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\2\2F\0\0\1\2\2\0\n-\0\0\0009\0\0\0B\0\1\1-\0\1\0\n\0\0\0X\0\3Ä-\0\1\0009\0\1\0B\0\1\1K\0\1\0\2¿\3¿\18focus_disable\topenN\0\0\1\2\2\0\n-\0\0\0009\0\0\0B\0\1\1-\0\1\0\n\0\0\0X\0\3Ä-\0\1\0009\0\1\0B\0\1\1K\0\1\0\2¿\3¿\18focus_disable\17file_historyO\0\0\2\1\4\0\v-\0\0\0\n\0\0\0X\0\3Ä-\0\0\0009\0\0\0B\0\1\0016\0\1\0009\0\2\0'\1\3\0B\0\2\1K\0\1\0\3¿\ttabc\bcmd\bvim\17focus_enable‹\f\1\0\t\0\\\2≥\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\0\1'\3\3\0B\2\2\0026\3\0\0'\4\3\0B\3\2\0029\3\4\0035\4\5\0005\5\6\0005\6\a\0=\6\b\5=\5\t\0045\5\15\0005\6\v\0005\a\n\0=\a\f\0065\a\r\0=\a\14\6=\6\16\5=\5\17\0045\5\18\0005\6\20\0009\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\"\0055\6$\0009\a#\0=\a%\0069\a&\0=\a'\0069\a#\0=\a(\0069\a&\0=\a)\0069\a*\0=\a+\0069\a*\0=\a,\0069\a-\0=\a.\0069\a/\0=\a0\0069\a1\0=\a2\0069\a3\0=\a4\0069\a5\0=\a6\0069\a7\0=\a8\0069\a9\0*\b\0\0B\a\2\2=\a:\0069\a9\0*\b\1\0B\a\2\2=\a;\0069\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a<\0=\a=\0069\a>\0=\a?\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\t\0055\6A\0009\a@\0=\aB\0069\aC\0=\aD\0069\aE\0=\aF\0069\a7\0=\a8\0069\aG\0=\aH\0069\aI\0=\aJ\0069\a#\0=\a%\0069\a#\0=\a(\0069\a&\0=\a'\0069\a&\0=\a)\0069\a*\0=\a+\0069\a*\0=\a,\0069\a*\0=\aK\0069\a9\0*\b\0\0B\a\2\2=\a:\0069\a9\0*\b\1\0B\a\2\2=\a;\0069\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\17\0055\6L\0009\a*\0=\a\21\0069\aM\0=\aN\6=\6O\5=\5P\4B\3\2\0016\3\0\0'\4Q\0B\3\2\0026\4R\0009\4S\0049\4T\4'\5U\0'\6V\0003\aW\0B\4\4\0016\4R\0009\4S\0049\4T\4'\5U\0'\6X\0003\aY\0B\4\4\0016\4R\0009\4S\0049\4T\4'\5U\0'\6Z\0003\a[\0B\4\4\0012\0\0ÄK\0\1\0\0\15<leader>dc\0\15<leader>dh\0\15<leader>df\6n\bset\vkeymap\bvim\nfocus\fkeymaps\17option_panel\6q\nclose\1\0\0\18<2-LeftMouse>\azM\20close_all_folds\azR\19open_all_folds\6y\14copy_hash\f<C-A-d>\21open_in_diffview\ag!\1\0\0\foptions\6f\24toggle_flatten_dirs\6i\18listing_style\n<c-f>\n<c-b>\16scroll_view\6L\20open_commit_log\6R\18refresh_files\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\6o\t<cr>\17select_entry\t<up>\v<down>\6k\15prev_entry\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<C-w>gf\18goto_file_tab\15<C-w><C-f>\20goto_file_split\agf\14goto_file\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\23file_history_panel\16log_options\1\0\0\15multi_file\1\0\1\16diff_merges\17first-parent\16single_file\1\0\0\1\0\1\16diff_merges\rcombined\15file_panel\17tree_options\1\0\2\17flatten_dirs\2\20folder_statuses\16only_folded\1\0\1\18listing_style\ttree\1\0\2\18diff_binaries\2\21enhanced_diff_hl\1\nsetup\rdiffview\18diffview.lazy\21diffview.actions\frequire\1ÄÄ¿˛\v\1ÄÄ¿˛\3\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\2 \1\0\0\4\2\f\0\0186\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0-\2\0\0=\2\4\1-\2\1\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\1\t\0'\2\n\0'\3\v\0B\0\4\1K\0\1\0\1¿\2¿\21:FocusToggle<cr>\15<leader>fd\6n\bset\vkeymap\bvim\22excluded_buftypes\23excluded_filetypes\1\0\1\17hybridnumber\1\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["git-conflict.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2¥\2\0\0\4\0\14\0\0286\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\b\0'\3\t\0B\0\4\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\n\0'\3\v\0B\0\4\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\f\0'\3\r\0B\0\4\1K\0\1\0\31:Gitsigns preview_hunk<cr>\15<leader>hv\28:Gitsigns prev_hunk<cr>\15<leader>hp\28:Gitsigns next_hunk<cr>\15<leader>hn\6n\bset\vkeymap\bvim\1\0\4\14word_diff\2\15signcolumn\2\vlinehl\1\nnumhl\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\2z\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\2\fverbose\1\fluasnip\2\1\0\2\15breakpoint\tüíî\15currentpos\tüëâ\nsetup\ago\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["link-visitor.nvim"] = {
    config = { "\27LJ\2\2I\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\vsilent\2\nsetup\17link-visitor\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/link-visitor.nvim",
    url = "https://github.com/xiyaowong/link-visitor.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp-format.nvim"] = {
    config = { "\27LJ\2\2@\0\1\3\0\3\0\a6\1\0\0'\2\1\0B\1\2\0029\1\2\1\18\2\0\0B\1\2\1K\0\1\0\14on_attach\15lsp-format\frequire∏\1\1\0\3\0\r\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\0013\0\b\0006\1\0\0'\2\t\0B\1\2\0029\1\n\0019\1\2\0015\2\v\0=\0\f\2B\1\2\1K\0\1\0\14on_attach\1\0\0\ngopls\14lspconfig\0\blua\1\0\1\14tab_width\3\2\tyaml\1\0\0\1\0\1\14tab_width\3\2\nsetup\15lsp-format\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lsp-format.nvim",
    url = "https://github.com/lukas-reineke/lsp-format.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\2n\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/neovim-gui-shim",
    url = "https://github.com/equalsraf/neovim-gui-shim"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\2\2Ò\b\0\0\24\0\27\1Ã\0016\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\1\0\0)\2\1\0\1\2\1\0X\1MÄ6\1\3\0\18\2\0\0B\1\2\4X\4GÄ\21\6\0\0\t\6\0\0X\6\1ÄX\1EÄ6\6\0\0009\6\1\0069\6\4\6\18\a\5\0B\6\2\2+\a\1\0004\b\0\0006\t\5\0\18\n\6\0B\t\2\4H\f(Ä6\14\0\0009\14\1\0149\14\6\14\18\15\r\0B\14\2\0026\15\a\0009\15\b\15\18\16\b\0\18\17\14\0B\15\3\2\18\b\15\0006\15\t\0009\15\n\0156\16\0\0009\16\v\0169\16\f\0166\17\0\0009\17\1\0179\17\r\17\18\18\14\0'\19\14\0B\17\3\0A\16\0\0A\15\0\0026\16\3\0005\17\15\0B\16\2\4X\19\nÄ6\21\t\0009\21\16\21\18\22\15\0\18\23\20\0B\21\3\2)\22\1\0\3\22\21\0X\21\2Ä+\a\2\0X\16\2ÄE\19\3\3R\19ÙF\f\3\3R\f÷\15\0\a\0X\t\fÄ6\t\5\0\18\n\b\0B\t\2\4H\f\6Ä6\14\0\0009\14\1\0149\14\17\14\18\15\r\0005\16\18\0B\14\3\1F\f\3\3R\f¯E\4\3\3R\4∑6\1\0\0009\1\1\0019\1\19\1B\1\1\0026\2\0\0009\2\20\0029\2\21\2\n\2\0\0X\2mÄ6\2\0\0009\2\v\0029\2\f\0026\3\0\0009\3\1\0039\3\22\0036\4\0\0009\4\1\0049\4\23\4B\4\1\0A\3\0\0A\2\0\0026\3\t\0009\3\16\3\18\4\2\0006\5\0\0009\5\20\0059\5\21\5)\6\1\0+\a\2\0B\3\5\2\b\3\0\0X\3\1Ä+\2\0\0\v\2\0\0X\3(Ä6\3\5\0\18\4\1\0B\3\2\4H\6\"Ä6\b\0\0009\b\v\b9\b\f\b6\t\0\0009\t\1\t9\t\22\t\18\n\a\0B\t\2\0A\b\0\0026\t\0\0009\t\v\t9\t\24\t\18\n\b\0B\t\2\2\15\0\t\0X\n\18Ä6\t\t\0009\t\16\t\18\n\b\0006\v\0\0009\v\20\v9\v\21\v)\f\1\0+\r\2\0B\t\5\2\t\t\0\0X\t\aÄ6\t\0\0009\t\1\t9\t\25\t\18\n\a\0B\t\2\1\18\2\b\0X\3\2ÄF\6\3\3R\6‹6\3\5\0\18\4\1\0B\3\2\4H\6%Ä\v\2\0\0X\b\2Ä\18\2\a\0X\b!Ä6\b\0\0009\b\v\b9\b\f\b6\t\0\0009\t\1\t9\t\22\t\18\n\a\0B\t\2\0A\b\0\0026\t\0\0009\t\v\t9\t\24\t\18\n\b\0B\t\2\2\15\0\t\0X\n\17Ä6\t\t\0009\t\16\t\18\n\b\0006\v\0\0009\v\20\v9\v\21\v)\f\1\0+\r\2\0B\t\5\2\b\t\0\0X\t\6Ä6\t\0\0009\t\1\t9\t\17\t\18\n\a\0005\v\26\0B\t\3\1F\6\3\3R\6ŸK\0\1\0\1\0\1\nforce\3\1\25nvim_set_current_buf\17filereadable\25nvim_get_current_buf\22nvim_buf_get_name\16SESSION_DIR\benv\19nvim_list_bufs\1\0\1\nforce\3\1\20nvim_buf_delete\tfind\1\3\0\0\rdiffview\vneogit\rfiletype\24nvim_buf_get_option\vexpand\afn\nlower\vstring\vinsert\ntable\21nvim_win_get_buf\npairs\27nvim_tabpage_list_wins\vipairs\23nvim_list_tabpages\bapi\bvim\2ˇ\3\0\0\v\0\26\0W6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0B\0\1\2\n\0\0\0X\1HÄ6\1\0\0009\1\a\1=\0\b\0016\1\0\0009\1\t\0014\2\3\0>\0\1\2=\2\n\0014\1\a\0\18\2\0\0'\3\v\0&\2\3\2>\2\1\1\18\2\0\0'\3\f\0&\2\3\2>\2\2\1\18\2\0\0'\3\r\0&\2\3\2>\2\3\1\18\2\0\0'\3\14\0&\2\3\2>\2\4\1\18\2\0\0'\3\15\0&\2\3\2>\2\5\1\18\2\0\0'\3\16\0&\2\3\2>\2\6\0016\2\0\0009\2\17\0029\2\18\2\18\3\0\0'\4\19\0B\2\3\2\n\2\0\0X\3\31Ä'\3\20\0\21\4\2\0008\4\4\2'\5\21\0&\3\5\0036\4\22\0\18\5\1\0B\4\2\4H\a\20Ä6\t\0\0009\t\17\t9\t\23\t\18\n\b\0B\t\2\2\a\t\24\0X\t\3Ä6\t\0\0009\t\1\t=\3\3\t6\t\0\0009\t\17\t9\t\23\t\18\n\b\0B\t\2\2\a\t\25\0X\t\3Ä6\t\0\0009\t\1\t=\3\3\tF\a\3\3R\aÍK\0\1\0\tfile\bdir\rgetftype\npairs\a ]\a[ \6/\nsplit\afn\18/package.json\f/go.mod\v/.idea\t/.hg\n/.svn\n/.git\21dirChangeHistory\6g\16SESSION_DIR\benv\bcwd\tloop\5\16titlestring\ntitle\6o\bvim¶\5\1\0\a\1\29\00046\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\n\0\18\4\0\0009\3\4\0006\5\5\0009\5\6\0059\5\a\5'\6\b\0B\5\2\2'\6\t\0B\3\4\2=\3\v\0026\3\0\0'\4\f\0B\3\2\0029\3\r\0039\3\14\3=\3\15\2-\3\0\0=\3\16\2B\1\2\0016\1\5\0009\1\17\0019\1\18\1'\2\19\0004\3\0\0B\1\3\0026\2\5\0009\2\17\0029\2\20\0025\3\21\0005\4\22\0=\1\23\0043\5\24\0=\5\25\4B\2\3\0016\2\5\0009\2\17\0029\2\20\0025\3\26\0005\4\27\0=\1\23\0043\5\28\0=\5\25\4B\2\3\1K\0\1\0\1¿\0\1\0\1\fpattern\20SessionLoadPost\1\2\0\0\tUser\rcallback\0\ngroup\1\0\1\fpattern\19SessionSavePre\1\2\0\0\tUser\24nvim_create_autocmd\18MyConfigGroup\24nvim_create_augroup\bapi\30autosave_ignore_filetypes\18autoload_mode\rDisabled\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\31autosave_ignore_not_normal\2\20max_path_length\3P\26autosave_last_session\2\19colon_replacer\a++\29autosave_only_in_session\1\18path_replacer\a__\21sessions-manager\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/neovim-session-manager",
    url = "https://github.com/Shatur/neovim-session-manager"
  },
  nerdcommenter = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nerdcommenter",
    url = "https://github.com/scrooloose/nerdcommenter"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\2‘\1\0\0\4\0\v\0\0226\0\0\0'\1\1\0B\0\2\0024\1\3\0009\2\2\0009\2\3\0029\2\4\2>\2\1\0019\2\2\0009\2\5\0029\2\6\2>\2\2\0019\2\a\0005\3\b\0=\1\t\3B\2\2\0019\2\a\0B\2\1\0016\2\0\0'\3\n\0B\2\2\1K\0\1\0\31../configs/go_code_actions\fsources\1\0\1\ndebug\1\nsetup\fluasnip\15completion\rgitsigns\17code_actions\rbuiltins\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\2π\1\0\0\4\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\15min_length\3\3\venable\2\15cursorline\1\0\0\1\0\3\vnumber\1\ftimeout\3Ë\a\venable\1\nsetup\20nvim-cursorline\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\2ø\3\0\0\6\0\f\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\4\0'\4\5\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\6\0'\4\a\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\b\0'\4\t\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\n\0'\4\v\0\18\5\0\0B\1\5\1K\0\1\0-#<Cmd>lua require('hlslens').start()<CR>\6#-*<Cmd>lua require('hlslens').start()<CR>\6*Y<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>\6NY<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\2¿\1\0\0\3\1\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1-\2\0\0=\2\6\1B\0\2\1K\0\1\0\1¿\30lastplace_ignore_filetype\29lastplace_ignore_buftype\1\0\1\25lastplace_open_folds\2\1\5\0\0\rquickfix\vnofile\thelp\rnvimtree\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\2¯\2\0\0\2\0\6\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\3\0009\0\4\0'\1\5\0B\0\2\1K\0\1\0™\2\t\t\t\tnnoremap <leader>S <cmd>lua require('spectre').open()<CR>\n\t\t\t\tnnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>\n\t\t\t\tvnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>\n\t\t\t\tnnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>\n\t\t\t\bcmd\bvim\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { "\27LJ\2\2û\3\0\0\5\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\n\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2=\2\v\1B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\20selection_modes\1\0\3\17@class.outer\n<c-v>\21@parameter.outer\6v\20@function.outer\6V\fkeymaps\1\0\n\aaF\20@function.outer\aiS\17@class.inner\aaL\16@loop.outer\aiF\20@function.inner\aaB\17@block.outer\aiC\23@conditional.inner\aiB\17@block.inner\aaS\17@class.outer\aiL\16@loop.inner\aaC\23@conditional.outer\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\2g\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    config = { "\27LJ\2\2à\1\0\0\3\0\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\1B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\0\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-ufo"] = {
    config = { "\27LJ\2\2%\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindent»\2\1\0\5\0\20\0-6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\a\0)\1c\0=\1\n\0006\0\6\0009\0\a\0)\1ˇˇ=\1\v\0006\0\6\0009\0\a\0+\1\2\0=\1\f\0006\0\6\0009\0\r\0009\0\14\0'\1\15\0'\2\16\0006\3\0\0'\4\1\0B\3\2\0029\3\17\3B\0\4\0016\0\6\0009\0\r\0009\0\14\0'\1\15\0'\2\18\0006\3\0\0'\4\1\0B\3\2\0029\3\19\3B\0\4\1K\0\1\0\18closeAllFolds\azM\17openAllFolds\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\6o\bvim\22provider_selector\1\0\0\0\nsetup\bufo\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-ufo",
    url = "https://github.com/kevinhwang91/nvim-ufo"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onenord.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/onenord.nvim",
    url = "https://github.com/rmehri01/onenord.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\2ﬁ\2\0\0\3\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1B\0\2\0016\0\0\0'\1\b\0B\0\2\0029\0\t\0'\1\n\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\1\4\0\0#~/go/pkg/mod/git.code.oa.com/*1~/.local/share/nvim/site/pack/packer/start/*\21~/.vim/plugged/*\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\1\0\3\16manual_mode\2\17silent_chdir\1\16show_hidden\2\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["promise-async"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/promise-async",
    url = "https://github.com/kevinhwang91/promise-async"
  },
  ["qf_helper.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14qf_helper\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/qf_helper.nvim",
    url = "https://github.com/stevearc/qf_helper.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\2<\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\15rust-tools\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  sniprun = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/sniprun",
    url = "https://github.com/michaelb/sniprun"
  },
  sonokai = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/sonokai",
    url = "https://github.com/sainnhe/sonokai"
  },
  ["sqls.nvim"] = {
    config = { "\27LJ\2\2>\0\2\5\0\3\0\b6\2\0\0'\3\1\0B\2\2\0029\2\2\2\18\3\0\0\18\4\1\0B\2\3\1K\0\1\0\14on_attach\tsqls\frequireZ\1\0\3\0\a\0\n6\0\0\0'\1\1\0B\0\2\0029\0\2\0009\0\3\0005\1\5\0003\2\4\0=\2\6\1B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\tsqls\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/sqls.nvim",
    url = "https://github.com/nanotee/sqls.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/snowair/symbols-outline.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    config = { "\27LJ\2\2S\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0B\0\2\1K\0\1\0\19live_grep_args\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-repo.nvim"] = {
    config = { "\27LJ\2\2È\1\0\0\6\0\15\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\n\0005\3\b\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\4=\4\t\3=\3\v\2=\2\r\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\14\0'\1\v\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\trepo\1\0\0\tlist\1\0\0\16search_dirs\1\3\0\0\n~/git\16/mnt/wd/Git\ffd_opts\1\0\0\1\2\0\0\20--no-ignore-vcs\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\2Õ\1\0\0\6\0\n\1\0246\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0005\2\5\0004\3\3\0006\4\0\0'\5\3\0B\4\2\0029\4\4\0044\5\0\0B\4\2\0?\4\0\0=\3\6\2=\2\b\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\t\0'\1\6\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\14ui-select\1\0\0\17get_dropdown\21telescope.themes\nsetup\14telescope\frequire\3ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\2‚\2\0\0\b\0\19\0\0306\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0015\3\r\0005\4\v\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\0055\6\t\0009\a\4\0=\a\6\6=\6\n\5=\5\f\4=\4\14\3B\2\2\0016\2\15\0009\2\16\2'\3\17\0B\2\2\0016\2\15\0009\2\16\2'\3\18\0B\2\2\1K\0\1\0:autocmd User TelescopePreviewerLoaded setlocal number8autocmd User TelescopePreviewerLoaded setlocal wrap\bcmd\bvim\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\nsetup\14telescope trouble.providers.telescope\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["text-case.nvim"] = {
    config = { "\27LJ\2\2é\2\0\0\5\0\14\0\0296\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\4\0'\1\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\1\b\0'\2\t\0'\3\n\0005\4\v\0B\0\5\0016\0\5\0009\0\6\0009\0\a\0'\1\f\0'\2\t\0'\3\n\0005\4\r\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Telescope\6v\1\0\1\tdesc\14Telescope#<cmd>TextCaseOpenTelescope<CR>\bga.\6n\20nvim_set_keymap\bapi\bvim\19load_extension\14telescope\nsetup\rtextcase\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/text-case.nvim",
    url = "https://github.com/johmsalas/text-case.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-easymotion"] = {
    config = { "\27LJ\2\2H\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0)\t\t\t\tnmap s <Plug>(easymotion-s2)\n\t\t\t\bcmd\bvim\0" },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-easymotion",
    url = "https://github.com/easymotion/vim-easymotion"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-exchange",
    url = "https://github.com/tommcdo/vim-exchange"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-markdown"] = {
    config = { '\27LJ\2\2°\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0K\0\1\0"vim_markdown_json_frontmatter\29vim_markdown_frontmatter\22vim_markdown_math\1\2\0\0\18javascript=js"vim_markdown_fenced_languages\29vim_markdown_toc_autofit"vim_markdown_folding_disabled\6g\bvim\0' },
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/preservim/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-table-mode"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-table-mode",
    url = "https://github.com/dhruvasagar/vim-table-mode"
  },
  ["vim-textobj-comment"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-comment",
    url = "https://github.com/glts/vim-textobj-comment"
  },
  ["vim-textobj-indblock"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-indblock",
    url = "https://github.com/glts/vim-textobj-indblock"
  },
  ["vim-textobj-indent"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-indent",
    url = "https://github.com/kana/vim-textobj-indent"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-line",
    url = "https://github.com/kana/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
  },
  ["vim-textobj-sentence"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-sentence",
    url = "https://github.com/reedes/vim-textobj-sentence"
  },
  ["vim-textobj-url"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-url",
    url = "https://github.com/mattn/vim-textobj-url"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-visual-increment"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-visual-increment",
    url = "https://github.com/triglav/vim-visual-increment"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/zhuyajie/.local/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\2n\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\1B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
try_loadstring("\27LJ\2\2´\2\0\0\4\1\n\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0004\3\0\0=\3\a\2-\3\0\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\1¿\15conditions\20filetype_is_not\20filename_is_not\1\0\2\15modifiable\2\vexists\2\vevents\1\4\0\0\16InsertLeave\17TextYankPost\rVimLeave\1\0\5\19debounce_delay\3á\1\22write_all_buffers\1\fenabled\2\20on_off_commands\2 clean_command_line_interval\3\0\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
time([[Config for AutoSave.nvim]], false)
-- Config for: sqls.nvim
time([[Config for sqls.nvim]], true)
try_loadstring("\27LJ\2\2>\0\2\5\0\3\0\b6\2\0\0'\3\1\0B\2\2\0029\2\2\2\18\3\0\0\18\4\1\0B\2\3\1K\0\1\0\14on_attach\tsqls\frequireZ\1\0\3\0\a\0\n6\0\0\0'\1\1\0B\0\2\0029\0\2\0009\0\3\0005\1\5\0003\2\4\0=\2\6\1B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\tsqls\14lspconfig\frequire\0", "config", "sqls.nvim")
time([[Config for sqls.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\2¿\1\0\0\3\1\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1-\2\0\0=\2\6\1B\0\2\1K\0\1\0\1¿\30lastplace_ignore_filetype\29lastplace_ignore_buftype\1\0\1\25lastplace_open_folds\2\1\5\0\0\rquickfix\vnofile\thelp\rnvimtree\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: telescope-ui-select.nvim
time([[Config for telescope-ui-select.nvim]], true)
try_loadstring("\27LJ\2\2Õ\1\0\0\6\0\n\1\0246\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\a\0005\2\5\0004\3\3\0006\4\0\0'\5\3\0B\4\2\0029\4\4\0044\5\0\0B\4\2\0?\4\0\0=\3\6\2=\2\b\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\t\0'\1\6\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\14ui-select\1\0\0\17get_dropdown\21telescope.themes\nsetup\14telescope\frequire\3ÄÄ¿ô\4\0", "config", "telescope-ui-select.nvim")
time([[Config for telescope-ui-select.nvim]], false)
-- Config for: neovim-session-manager
time([[Config for neovim-session-manager]], true)
try_loadstring("\27LJ\2\2Ò\b\0\0\24\0\27\1Ã\0016\0\0\0009\0\1\0009\0\2\0B\0\1\2\21\1\0\0)\2\1\0\1\2\1\0X\1MÄ6\1\3\0\18\2\0\0B\1\2\4X\4GÄ\21\6\0\0\t\6\0\0X\6\1ÄX\1EÄ6\6\0\0009\6\1\0069\6\4\6\18\a\5\0B\6\2\2+\a\1\0004\b\0\0006\t\5\0\18\n\6\0B\t\2\4H\f(Ä6\14\0\0009\14\1\0149\14\6\14\18\15\r\0B\14\2\0026\15\a\0009\15\b\15\18\16\b\0\18\17\14\0B\15\3\2\18\b\15\0006\15\t\0009\15\n\0156\16\0\0009\16\v\0169\16\f\0166\17\0\0009\17\1\0179\17\r\17\18\18\14\0'\19\14\0B\17\3\0A\16\0\0A\15\0\0026\16\3\0005\17\15\0B\16\2\4X\19\nÄ6\21\t\0009\21\16\21\18\22\15\0\18\23\20\0B\21\3\2)\22\1\0\3\22\21\0X\21\2Ä+\a\2\0X\16\2ÄE\19\3\3R\19ÙF\f\3\3R\f÷\15\0\a\0X\t\fÄ6\t\5\0\18\n\b\0B\t\2\4H\f\6Ä6\14\0\0009\14\1\0149\14\17\14\18\15\r\0005\16\18\0B\14\3\1F\f\3\3R\f¯E\4\3\3R\4∑6\1\0\0009\1\1\0019\1\19\1B\1\1\0026\2\0\0009\2\20\0029\2\21\2\n\2\0\0X\2mÄ6\2\0\0009\2\v\0029\2\f\0026\3\0\0009\3\1\0039\3\22\0036\4\0\0009\4\1\0049\4\23\4B\4\1\0A\3\0\0A\2\0\0026\3\t\0009\3\16\3\18\4\2\0006\5\0\0009\5\20\0059\5\21\5)\6\1\0+\a\2\0B\3\5\2\b\3\0\0X\3\1Ä+\2\0\0\v\2\0\0X\3(Ä6\3\5\0\18\4\1\0B\3\2\4H\6\"Ä6\b\0\0009\b\v\b9\b\f\b6\t\0\0009\t\1\t9\t\22\t\18\n\a\0B\t\2\0A\b\0\0026\t\0\0009\t\v\t9\t\24\t\18\n\b\0B\t\2\2\15\0\t\0X\n\18Ä6\t\t\0009\t\16\t\18\n\b\0006\v\0\0009\v\20\v9\v\21\v)\f\1\0+\r\2\0B\t\5\2\t\t\0\0X\t\aÄ6\t\0\0009\t\1\t9\t\25\t\18\n\a\0B\t\2\1\18\2\b\0X\3\2ÄF\6\3\3R\6‹6\3\5\0\18\4\1\0B\3\2\4H\6%Ä\v\2\0\0X\b\2Ä\18\2\a\0X\b!Ä6\b\0\0009\b\v\b9\b\f\b6\t\0\0009\t\1\t9\t\22\t\18\n\a\0B\t\2\0A\b\0\0026\t\0\0009\t\v\t9\t\24\t\18\n\b\0B\t\2\2\15\0\t\0X\n\17Ä6\t\t\0009\t\16\t\18\n\b\0006\v\0\0009\v\20\v9\v\21\v)\f\1\0+\r\2\0B\t\5\2\b\t\0\0X\t\6Ä6\t\0\0009\t\1\t9\t\17\t\18\n\a\0005\v\26\0B\t\3\1F\6\3\3R\6ŸK\0\1\0\1\0\1\nforce\3\1\25nvim_set_current_buf\17filereadable\25nvim_get_current_buf\22nvim_buf_get_name\16SESSION_DIR\benv\19nvim_list_bufs\1\0\1\nforce\3\1\20nvim_buf_delete\tfind\1\3\0\0\rdiffview\vneogit\rfiletype\24nvim_buf_get_option\vexpand\afn\nlower\vstring\vinsert\ntable\21nvim_win_get_buf\npairs\27nvim_tabpage_list_wins\vipairs\23nvim_list_tabpages\bapi\bvim\2ˇ\3\0\0\v\0\26\0W6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0'\1\4\0=\1\3\0006\0\0\0009\0\5\0009\0\6\0B\0\1\2\n\0\0\0X\1HÄ6\1\0\0009\1\a\1=\0\b\0016\1\0\0009\1\t\0014\2\3\0>\0\1\2=\2\n\0014\1\a\0\18\2\0\0'\3\v\0&\2\3\2>\2\1\1\18\2\0\0'\3\f\0&\2\3\2>\2\2\1\18\2\0\0'\3\r\0&\2\3\2>\2\3\1\18\2\0\0'\3\14\0&\2\3\2>\2\4\1\18\2\0\0'\3\15\0&\2\3\2>\2\5\1\18\2\0\0'\3\16\0&\2\3\2>\2\6\0016\2\0\0009\2\17\0029\2\18\2\18\3\0\0'\4\19\0B\2\3\2\n\2\0\0X\3\31Ä'\3\20\0\21\4\2\0008\4\4\2'\5\21\0&\3\5\0036\4\22\0\18\5\1\0B\4\2\4H\a\20Ä6\t\0\0009\t\17\t9\t\23\t\18\n\b\0B\t\2\2\a\t\24\0X\t\3Ä6\t\0\0009\t\1\t=\3\3\t6\t\0\0009\t\17\t9\t\23\t\18\n\b\0B\t\2\2\a\t\25\0X\t\3Ä6\t\0\0009\t\1\t=\3\3\tF\a\3\3R\aÍK\0\1\0\tfile\bdir\rgetftype\npairs\a ]\a[ \6/\nsplit\afn\18/package.json\f/go.mod\v/.idea\t/.hg\n/.svn\n/.git\21dirChangeHistory\6g\16SESSION_DIR\benv\bcwd\tloop\5\16titlestring\ntitle\6o\bvim¶\5\1\0\a\1\29\00046\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\1\3\0015\2\n\0\18\4\0\0009\3\4\0006\5\5\0009\5\6\0059\5\a\5'\6\b\0B\5\2\2'\6\t\0B\3\4\2=\3\v\0026\3\0\0'\4\f\0B\3\2\0029\3\r\0039\3\14\3=\3\15\2-\3\0\0=\3\16\2B\1\2\0016\1\5\0009\1\17\0019\1\18\1'\2\19\0004\3\0\0B\1\3\0026\2\5\0009\2\17\0029\2\20\0025\3\21\0005\4\22\0=\1\23\0043\5\24\0=\5\25\4B\2\3\0016\2\5\0009\2\17\0029\2\20\0025\3\26\0005\4\27\0=\1\23\0043\5\28\0=\5\25\4B\2\3\1K\0\1\0\1¿\0\1\0\1\fpattern\20SessionLoadPost\1\2\0\0\tUser\rcallback\0\ngroup\1\0\1\fpattern\19SessionSavePre\1\2\0\0\tUser\24nvim_create_autocmd\18MyConfigGroup\24nvim_create_augroup\bapi\30autosave_ignore_filetypes\18autoload_mode\rDisabled\17AutoloadMode\27session_manager.config\17sessions_dir\1\0\6\31autosave_ignore_not_normal\2\20max_path_length\3P\26autosave_last_session\2\19colon_replacer\a++\29autosave_only_in_session\1\18path_replacer\a__\21sessions-manager\tdata\fstdpath\afn\bvim\bnew\nsetup\20session_manager\17plenary.path\frequire\0", "config", "neovim-session-manager")
time([[Config for neovim-session-manager]], false)
-- Config for: hlargs.nvim
time([[Config for hlargs.nvim]], true)
try_loadstring("\27LJ\2\0024\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")
time([[Config for hlargs.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\2ø\3\0\0\6\0\f\0\"5\0\0\0006\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\4\0'\4\5\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\6\0'\4\a\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\b\0'\4\t\0\18\5\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\2\4\0'\3\n\0'\4\v\0\18\5\0\0B\1\5\1K\0\1\0-#<Cmd>lua require('hlslens').start()<CR>\6#-*<Cmd>lua require('hlslens').start()<CR>\6*Y<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>\6NY<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\vsilent\2\fnoremap\2\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lsp-format.nvim
time([[Config for lsp-format.nvim]], true)
try_loadstring("\27LJ\2\2@\0\1\3\0\3\0\a6\1\0\0'\2\1\0B\1\2\0029\1\2\1\18\2\0\0B\1\2\1K\0\1\0\14on_attach\15lsp-format\frequire∏\1\1\0\3\0\r\0\0206\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\1B\0\2\0013\0\b\0006\1\0\0'\2\t\0B\1\2\0029\1\n\0019\1\2\0015\2\v\0=\0\f\2B\1\2\1K\0\1\0\14on_attach\1\0\0\ngopls\14lspconfig\0\blua\1\0\1\14tab_width\3\2\tyaml\1\0\0\1\0\1\14tab_width\3\2\nsetup\15lsp-format\frequire\0", "config", "lsp-format.nvim")
time([[Config for lsp-format.nvim]], false)
-- Config for: telescope-repo.nvim
time([[Config for telescope-repo.nvim]], true)
try_loadstring("\27LJ\2\2È\1\0\0\6\0\15\0\0236\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\n\0005\3\b\0005\4\4\0005\5\3\0=\5\5\0045\5\6\0=\5\a\4=\4\t\3=\3\v\2=\2\r\1B\0\2\0016\0\0\0'\1\1\0B\0\2\0029\0\14\0'\1\v\0B\0\2\1K\0\1\0\19load_extension\15extensions\1\0\0\trepo\1\0\0\tlist\1\0\0\16search_dirs\1\3\0\0\n~/git\16/mnt/wd/Git\ffd_opts\1\0\0\1\2\0\0\20--no-ignore-vcs\nsetup\14telescope\frequire\0", "config", "telescope-repo.nvim")
time([[Config for telescope-repo.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\2 \1\0\0\4\2\f\0\0186\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0-\2\0\0=\2\4\1-\2\1\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\1\t\0'\2\n\0'\3\v\0B\0\4\1K\0\1\0\1¿\2¿\21:FocusToggle<cr>\15<leader>fd\6n\bset\vkeymap\bvim\22excluded_buftypes\23excluded_filetypes\1\0\1\17hybridnumber\1\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: link-visitor.nvim
time([[Config for link-visitor.nvim]], true)
try_loadstring("\27LJ\2\2I\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\0\1\vsilent\2\nsetup\17link-visitor\frequire\0", "config", "link-visitor.nvim")
time([[Config for link-visitor.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2¥\2\0\0\4\0\14\0\0286\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\b\0'\3\t\0B\0\4\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\n\0'\3\v\0B\0\4\0016\0\4\0009\0\5\0009\0\6\0'\1\a\0'\2\f\0'\3\r\0B\0\4\1K\0\1\0\31:Gitsigns preview_hunk<cr>\15<leader>hv\28:Gitsigns prev_hunk<cr>\15<leader>hp\28:Gitsigns next_hunk<cr>\15<leader>hn\6n\bset\vkeymap\bvim\1\0\4\14word_diff\2\15signcolumn\2\vlinehl\1\nnumhl\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: go.nvim
time([[Config for go.nvim]], true)
try_loadstring("\27LJ\2\2z\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\nicons\1\0\2\fverbose\1\fluasnip\2\1\0\2\15breakpoint\tüíî\15currentpos\tüëâ\nsetup\ago\frequire\0", "config", "go.nvim")
time([[Config for go.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\2∫\1\0\0\4\0\t\0\0226\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\6\0'\3\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\a\0'\3\b\0B\0\4\1K\0\1\0\29:BufferLineCyclePrev<cr>\f<S-Tab>\f<A-Tab>\29:BufferLineCycleNext<cr>\f<C-Tab>\6n\bset\vkeymap\bvim\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: vim-markdown
time([[Config for vim-markdown]], true)
try_loadstring('\27LJ\2\2°\2\0\0\2\0\t\0\0256\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0005\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0)\1\1\0=\1\b\0K\0\1\0"vim_markdown_json_frontmatter\29vim_markdown_frontmatter\22vim_markdown_math\1\2\0\0\18javascript=js"vim_markdown_fenced_languages\29vim_markdown_toc_autofit"vim_markdown_folding_disabled\6g\bvim\0', "config", "vim-markdown")
time([[Config for vim-markdown]], false)
-- Config for: telescope-live-grep-args.nvim
time([[Config for telescope-live-grep-args.nvim]], true)
try_loadstring("\27LJ\2\2S\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0'\1\3\0B\0\2\1K\0\1\0\19live_grep_args\19load_extension\14telescope\frequire\0", "config", "telescope-live-grep-args.nvim")
time([[Config for telescope-live-grep-args.nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
try_loadstring("\27LJ\2\2π\1\0\0\4\0\n\0\r6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0005\3\a\0=\3\b\2=\2\t\1B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\15min_length\3\3\venable\2\15cursorline\1\0\0\1\0\3\vnumber\1\ftimeout\3Ë\a\venable\1\nsetup\20nvim-cursorline\frequire\0", "config", "nvim-cursorline")
time([[Config for nvim-cursorline]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\2=\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\2\2F\0\0\1\2\2\0\n-\0\0\0009\0\0\0B\0\1\1-\0\1\0\n\0\0\0X\0\3Ä-\0\1\0009\0\1\0B\0\1\1K\0\1\0\2¿\3¿\18focus_disable\topenN\0\0\1\2\2\0\n-\0\0\0009\0\0\0B\0\1\1-\0\1\0\n\0\0\0X\0\3Ä-\0\1\0009\0\1\0B\0\1\1K\0\1\0\2¿\3¿\18focus_disable\17file_historyO\0\0\2\1\4\0\v-\0\0\0\n\0\0\0X\0\3Ä-\0\0\0009\0\0\0B\0\1\0016\0\1\0009\0\2\0'\1\3\0B\0\2\1K\0\1\0\3¿\ttabc\bcmd\bvim\17focus_enable‹\f\1\0\t\0\\\2≥\0016\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\0\1'\3\3\0B\2\2\0026\3\0\0'\4\3\0B\3\2\0029\3\4\0035\4\5\0005\5\6\0005\6\a\0=\6\b\5=\5\t\0045\5\15\0005\6\v\0005\a\n\0=\a\f\0065\a\r\0=\a\14\6=\6\16\5=\5\17\0045\5\18\0005\6\20\0009\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\"\0055\6$\0009\a#\0=\a%\0069\a&\0=\a'\0069\a#\0=\a(\0069\a&\0=\a)\0069\a*\0=\a+\0069\a*\0=\a,\0069\a-\0=\a.\0069\a/\0=\a0\0069\a1\0=\a2\0069\a3\0=\a4\0069\a5\0=\a6\0069\a7\0=\a8\0069\a9\0*\b\0\0B\a\2\2=\a:\0069\a9\0*\b\1\0B\a\2\2=\a;\0069\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a<\0=\a=\0069\a>\0=\a?\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\t\0055\6A\0009\a@\0=\aB\0069\aC\0=\aD\0069\aE\0=\aF\0069\a7\0=\a8\0069\aG\0=\aH\0069\aI\0=\aJ\0069\a#\0=\a%\0069\a#\0=\a(\0069\a&\0=\a'\0069\a&\0=\a)\0069\a*\0=\a+\0069\a*\0=\a,\0069\a*\0=\aK\0069\a9\0*\b\0\0B\a\2\2=\a:\0069\a9\0*\b\1\0B\a\2\2=\a;\0069\a\19\0=\a\21\0069\a\22\0=\a\23\0069\a\24\0=\a\25\0069\a\26\0=\a\27\0069\a\28\0=\a\29\0069\a\30\0=\a\31\0069\a \0=\a!\6=\6\17\0055\6L\0009\a*\0=\a\21\0069\aM\0=\aN\6=\6O\5=\5P\4B\3\2\0016\3\0\0'\4Q\0B\3\2\0026\4R\0009\4S\0049\4T\4'\5U\0'\6V\0003\aW\0B\4\4\0016\4R\0009\4S\0049\4T\4'\5U\0'\6X\0003\aY\0B\4\4\0016\4R\0009\4S\0049\4T\4'\5U\0'\6Z\0003\a[\0B\4\4\0012\0\0ÄK\0\1\0\0\15<leader>dc\0\15<leader>dh\0\15<leader>df\6n\bset\vkeymap\bvim\nfocus\fkeymaps\17option_panel\6q\nclose\1\0\0\18<2-LeftMouse>\azM\20close_all_folds\azR\19open_all_folds\6y\14copy_hash\f<C-A-d>\21open_in_diffview\ag!\1\0\0\foptions\6f\24toggle_flatten_dirs\6i\18listing_style\n<c-f>\n<c-b>\16scroll_view\6L\20open_commit_log\6R\18refresh_files\6X\18restore_entry\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\6o\t<cr>\17select_entry\t<up>\v<down>\6k\15prev_entry\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<C-w>gf\18goto_file_tab\15<C-w><C-f>\20goto_file_split\agf\14goto_file\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\23file_history_panel\16log_options\1\0\0\15multi_file\1\0\1\16diff_merges\17first-parent\16single_file\1\0\0\1\0\1\16diff_merges\rcombined\15file_panel\17tree_options\1\0\2\17flatten_dirs\2\20folder_statuses\16only_folded\1\0\1\18listing_style\ttree\1\0\2\18diff_binaries\2\21enhanced_diff_hl\1\nsetup\rdiffview\18diffview.lazy\21diffview.actions\frequire\1ÄÄ¿˛\v\1ÄÄ¿˛\3\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: nvim-ufo
time([[Config for nvim-ufo]], true)
try_loadstring("\27LJ\2\2%\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\3\0\0\15treesitter\vindent»\2\1\0\5\0\20\0-6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0003\2\3\0=\2\5\1B\0\2\0016\0\6\0009\0\a\0'\1\t\0=\1\b\0006\0\6\0009\0\a\0)\1c\0=\1\n\0006\0\6\0009\0\a\0)\1ˇˇ=\1\v\0006\0\6\0009\0\a\0+\1\2\0=\1\f\0006\0\6\0009\0\r\0009\0\14\0'\1\15\0'\2\16\0006\3\0\0'\4\1\0B\3\2\0029\3\17\3B\0\4\0016\0\6\0009\0\r\0009\0\14\0'\1\15\0'\2\18\0006\3\0\0'\4\1\0B\3\2\0029\3\19\3B\0\4\1K\0\1\0\18closeAllFolds\azM\17openAllFolds\azR\6n\bset\vkeymap\15foldenable\19foldlevelstart\14foldlevel\0061\15foldcolumn\6o\bvim\22provider_selector\1\0\0\0\nsetup\bufo\frequire\0", "config", "nvim-ufo")
time([[Config for nvim-ufo]], false)
-- Config for: qf_helper.nvim
time([[Config for qf_helper.nvim]], true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14qf_helper\frequire\0", "config", "qf_helper.nvim")
time([[Config for qf_helper.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\0028\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: nvim-treesitter-textobjects
time([[Config for nvim-treesitter-textobjects]], true)
try_loadstring("\27LJ\2\2û\3\0\0\5\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\n\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2=\2\v\1B\0\2\1K\0\1\0\16textobjects\1\0\0\vselect\1\0\0\20selection_modes\1\0\3\17@class.outer\n<c-v>\21@parameter.outer\6v\20@function.outer\6V\fkeymaps\1\0\n\aaF\20@function.outer\aiS\17@class.inner\aaL\16@loop.outer\aiF\20@function.inner\aaB\17@block.outer\aiC\23@conditional.inner\aiB\17@block.inner\aaS\17@class.outer\aiL\16@loop.inner\aaC\23@conditional.outer\1\0\2\14lookahead\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter-textobjects")
time([[Config for nvim-treesitter-textobjects]], false)
-- Config for: text-case.nvim
time([[Config for text-case.nvim]], true)
try_loadstring("\27LJ\2\2é\2\0\0\5\0\14\0\0296\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\0\0'\1\3\0B\0\2\0029\0\4\0'\1\1\0B\0\2\0016\0\5\0009\0\6\0009\0\a\0'\1\b\0'\2\t\0'\3\n\0005\4\v\0B\0\5\0016\0\5\0009\0\6\0009\0\a\0'\1\f\0'\2\t\0'\3\n\0005\4\r\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Telescope\6v\1\0\1\tdesc\14Telescope#<cmd>TextCaseOpenTelescope<CR>\bga.\6n\20nvim_set_keymap\bapi\bvim\19load_extension\14telescope\nsetup\rtextcase\frequire\0", "config", "text-case.nvim")
time([[Config for text-case.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\2ﬁ\2\0\0\3\0\v\0\0176\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0005\2\4\0=\2\5\0015\2\6\0=\2\a\1B\0\2\0016\0\0\0'\1\b\0B\0\2\0029\0\t\0'\1\n\0B\0\2\1K\0\1\0\rprojects\19load_extension\14telescope\17exclude_dirs\1\4\0\0#~/go/pkg/mod/git.code.oa.com/*1~/.local/share/nvim/site/pack/packer/start/*\21~/.vim/plugged/*\rpatterns\1\b\0\0\t.git\v_darcs\b.hg\t.bzr\t.svn\rMakefile\17package.json\1\0\3\16manual_mode\2\17silent_chdir\1\16show_hidden\2\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\2g\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\fautotag\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\2‚\2\0\0\b\0\19\0\0306\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0015\3\r\0005\4\v\0005\5\a\0005\6\5\0009\a\4\0=\a\6\6=\6\b\0055\6\t\0009\a\4\0=\a\6\6=\6\n\5=\5\f\4=\4\14\3B\2\2\0016\2\15\0009\2\16\2'\3\17\0B\2\2\0016\2\15\0009\2\16\2'\3\18\0B\2\2\1K\0\1\0:autocmd User TelescopePreviewerLoaded setlocal number8autocmd User TelescopePreviewerLoaded setlocal wrap\bcmd\bvim\rdefaults\1\0\0\rmappings\1\0\0\6n\1\0\0\6i\1\0\0\n<c-t>\1\0\0\22open_with_trouble\nsetup\14telescope trouble.providers.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
try_loadstring("\27LJ\2\2à\1\0\0\3\0\a\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0004\2\0\0=\2\4\0015\2\5\0=\2\6\1B\0\2\1K\0\1\0\frainbow\1\0\2\18extended_mode\2\venable\2\14highlight\1\0\0\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-rainbow")
time([[Config for nvim-ts-rainbow]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-dap-virtual-text
time([[Config for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0", "config", "nvim-dap-virtual-text")
time([[Config for nvim-dap-virtual-text]], false)
-- Config for: git-conflict.nvim
time([[Config for git-conflict.nvim]], true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0", "config", "git-conflict.nvim")
time([[Config for git-conflict.nvim]], false)
-- Config for: vim-easymotion
time([[Config for vim-easymotion]], true)
try_loadstring("\27LJ\2\2H\0\0\2\0\3\0\0056\0\0\0009\0\1\0'\1\2\0B\0\2\1K\0\1\0)\t\t\t\tnmap s <Plug>(easymotion-s2)\n\t\t\t\bcmd\bvim\0", "config", "vim-easymotion")
time([[Config for vim-easymotion]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
try_loadstring("\27LJ\2\2´\15\0\0\r\0P\0ˆ\1'\0\0\0'\1\1\0'\2\2\0'\3\3\0'\4\4\0006\5\5\0'\6\6\0B\5\2\0026\6\5\0'\a\a\0B\6\2\0029\6\b\6\18\a\6\0009\6\t\0065\b8\0004\t\25\0009\n\n\0059\n\v\n5\v\f\0004\f\3\0>\0\1\f>\1\2\f=\f\r\vB\n\2\2>\n\1\t9\n\n\0059\n\v\n5\v\14\0004\f\4\0>\2\1\f>\3\2\f>\4\3\f=\f\r\vB\n\2\2>\n\2\t9\n\n\0059\n\v\n5\v\16\0005\f\15\0=\f\r\vB\n\2\2>\n\3\t9\n\n\0059\n\v\n5\v\18\0005\f\17\0=\f\r\vB\n\2\2>\n\4\t9\n\n\0059\n\v\n5\v\20\0005\f\19\0=\f\r\vB\n\2\2>\n\5\t9\n\n\0059\n\v\n5\v\22\0005\f\21\0=\f\r\vB\n\2\2>\n\6\t9\n\n\0059\n\v\n5\v\24\0005\f\23\0=\f\r\vB\n\2\2>\n\a\t9\n\n\0059\n\v\n5\v\26\0005\f\25\0=\f\r\vB\n\2\2>\n\b\t9\n\n\0059\n\v\n5\v\28\0005\f\27\0=\f\r\vB\n\2\2>\n\t\t9\n\n\0059\n\v\n5\v\30\0005\f\29\0=\f\r\vB\n\2\2>\n\n\t9\n\n\0059\n\v\n5\v \0005\f\31\0=\f\r\vB\n\2\2>\n\v\t9\n\n\0059\n\v\n5\v\"\0005\f!\0=\f\r\vB\n\2\2>\n\f\t9\n\n\0059\n\v\n5\v$\0005\f#\0=\f\r\vB\n\2\2>\n\r\t9\n\n\0059\n\v\n5\v&\0005\f%\0=\f\r\vB\n\2\2>\n\14\t9\n\n\0059\n\v\n5\v(\0005\f'\0=\f\r\vB\n\2\2>\n\15\t9\n\n\0059\n\v\n5\v*\0005\f)\0=\f\r\vB\n\2\2>\n\16\t9\n\n\0059\n\v\n5\v,\0005\f+\0=\f\r\vB\n\2\2>\n\17\t9\n\n\0059\n\v\n5\v.\0005\f-\0=\f\r\vB\n\2\2>\n\18\t9\n/\0059\n0\n9\n1\n>\n\19\t9\n/\0059\n0\n9\n2\n>\n\20\t9\n3\0059\n0\n9\n4\n>\n\21\t9\n\n\0059\n0\n9\n5\n>\n\22\t9\n\n\0059\n0\n9\n6\n>\n\23\t9\n\n\0059\n0\n9\n7\n>\n\24\t=\t9\bB\6\3\0016\6:\0009\6;\0069\6<\6'\a=\0'\b>\0006\t\5\0'\n?\0B\t\2\0029\t@\tB\t\1\0025\nA\0B\6\5\0016\6:\0009\6;\0069\6<\6'\a=\0'\bB\0006\t\5\0'\n?\0B\t\2\0029\tC\tB\t\1\0025\nD\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\b>\0006\t\5\0'\n?\0B\t\2\0029\tF\tB\t\1\0025\nG\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bB\0006\t\5\0'\n?\0B\t\2\0029\tH\tB\t\1\0025\nI\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bJ\0006\t\5\0'\n?\0B\t\2\0029\tK\tB\t\1\0025\nL\0B\6\5\0016\6:\0009\6;\0069\6<\6'\aE\0'\bM\0006\t\5\0'\n?\0B\t\2\0029\tN\tB\t\1\0025\nO\0B\6\5\1K\0\1\0\1\0\1\fnoremap\2\16dec_gvisual\vg<C-x>\1\0\1\fnoremap\2\16inc_gvisual\vg<C-a>\1\0\1\fnoremap\2\15dec_visual\1\0\1\fnoremap\2\15inc_visual\6v\1\0\1\fnoremap\2\15dec_normal\n<C-x>\1\0\1\fnoremap\2\15inc_normal\rdial.map\n<C-a>\6n\20nvim_set_keymap\bapi\bvim\fdefault\1\0\0\nAlpha\nalpha\tbool\r%Y/%m/%d\tdate\bhex\fdecimal\nalias\finteger\1\0\2\vcyclic\2\tword\2\1\5\0\0\nError\tWarn\tInfo\nDebug\1\0\2\vcyclic\2\tword\2\1\3\0\0\bGET\tPOST\1\0\2\vcyclic\2\tword\1\1\3\0\0\f[]byte(\fstring(\1\0\2\vcyclic\2\tword\2\1\4\0\0\6\"\t‚Äú \b‚Äù\1\0\2\vcyclic\2\tword\2\1\4\0\0\6.\b„ÄÇ\bÔºé\1\0\2\vcyclic\2\tword\2\1\3\0\0\6,\bÔºå\1\0\2\vcyclic\2\tword\2\1\3\0\0\6+\6-\1\0\2\vcyclic\2\tword\2\1\3\0\0\fenabled\rdisabled\1\0\2\vcyclic\2\tword\2\1\3\0\0\venable\fdisable\1\0\2\vcyclic\2\tword\2\1\3\0\0\bmin\bmax\1\0\2\vcyclic\2\tword\2\1\3\0\0\tdesc\basc\1\0\2\vcyclic\2\tword\2\1\3\0\0\fsuccess\nerror\1\0\2\vcyclic\2\tword\2\1\4\0\0\tuint\vuint32\vuint64\1\0\2\vcyclic\2\tword\2\1\4\0\0\bint\nint32\nint64\1\0\2\vcyclic\2\tword\1\1\3\0\0\a&&\a||\1\0\2\vcyclic\2\tword\2\1\3\0\0\band\aor\1\0\2\vcyclic\2\tword\1\relements\1\0\2\vcyclic\2\tword\2\bnew\rconstant\19register_group\faugends\16dial.config\16dial.augend\frequire\r15:04:05\r20060102\0152006-01-02\01920060102150405\0242006-01-02 15:04:05\0", "config", "dial.nvim")
time([[Config for dial.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\2¯\2\0\0\2\0\6\0\v6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\0016\0\3\0009\0\4\0'\1\5\0B\0\2\1K\0\1\0™\2\t\t\t\tnnoremap <leader>S <cmd>lua require('spectre').open()<CR>\n\t\t\t\tnnoremap <leader>sw :lua require('spectre').open_visual({select_word=true})<CR>\n\t\t\t\tvnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>\n\t\t\t\tnnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>\n\t\t\t\bcmd\bvim\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: rust-tools.nvim
time([[Config for rust-tools.nvim]], true)
try_loadstring("\27LJ\2\2<\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\15rust-tools\frequire\0", "config", "rust-tools.nvim")
time([[Config for rust-tools.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\2‘\1\0\0\4\0\v\0\0226\0\0\0'\1\1\0B\0\2\0024\1\3\0009\2\2\0009\2\3\0029\2\4\2>\2\1\0019\2\2\0009\2\5\0029\2\6\2>\2\2\0019\2\a\0005\3\b\0=\1\t\3B\2\2\0019\2\a\0B\2\1\0016\2\0\0'\3\n\0B\2\2\1K\0\1\0\31../configs/go_code_actions\fsources\1\0\1\ndebug\1\nsetup\fluasnip\15completion\rgitsigns\17code_actions\rbuiltins\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
