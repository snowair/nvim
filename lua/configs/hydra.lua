local M = {}
local Hydra = require('hydra')
local gitsigns = require('gitsigns')
local cmd = require('hydra.keymap-util').cmd

function M.config()
  Hydra({
    name = "窗口管理", -- 可选,仅用于自动生成hint
    mode = { 'n' }, -- 允许触发的模式
    body = '<c-w>', -- 触发前置键位
    heads = {
      { 'h', '<c-w>h' },
      { 'j', '<c-w>j' },
      { 'k', '<c-w>k' },
      { 'l', '<c-w>l' },

      { 'H', '<c-w>3<' },
      { 'L', '<c-w>3>' },
      { 'K', '<c-w>2+' },
      { 'J', '<c-w>2-' },
      { 'e', '<c-w>=' },

      -- exit this hydra
      { 'q', nil,
        {
          exit = true,  -- 执行命名后退出hydra
          nowait = true -- 退出hydra2无需等待命令
        }
      },
      { '<esc>', nil,
        {
          exit = true,
          nowait = true
        }
      },
    }
  })

  Hydra({
    name = '横向滚动',
    mode = { 'n' },
    body = 'z',
    heads = {
      { 'h', '5zh' },
      { 'l', '5zl', { desc = '←/→' } },
      { 'H', 'zH' },
      { 'L', 'zL',  { desc = 'half screen ←/→' } },
    }
  })

  Hydra({
    name = 'Telescope',
    hint = [[

   🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _o_: old files
  🭉🭁🭠🭘    🭣🭕🭌🬾
  🭅█ ▁     █🭐   _O_: options
  ██🬿      🭊██   _?_: search history
 🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀  _c_: execute command
 🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙  _;_: commands history

 ^
    _<Enter>_: Telescope  _<Esc>_
]]
    ,
    config = {
      color = 'teal',
      invoke_on_body = true,
      hint = {
        position = 'middle',
        border = 'rounded',
      },
    },
    mode = 'n',
    body = '<Leader>f',
    heads = {
      { 'o',       cmd 'Telescope oldfiles',        { desc = 'recently opened files' } },
      { 'O',       cmd 'Telescope vim_options' },
      { '?',       cmd 'Telescope search_history',  { desc = 'search history' } },
      { ';',       cmd 'Telescope command_history', { desc = 'command-line history' } },
      { 'c',       cmd 'Telescope commands',        { desc = 'execute command' } },
      { '<Enter>', cmd 'Telescope',                 { exit = true, desc = 'list all pickers' } },
      { '<Esc>',   nil,                             { exit = true, nowait = true } },
    }
  })


  Hydra({
    name = 'Vim Options',
    hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  ^
       ^^^^                _<Esc>_
]],
    config = {
      color = 'amaranth',
      invoke_on_body = true,
      hint = {
        border = 'rounded',
        position = 'middle'
      }
    },
    mode = { 'n', 'x' },
    body = '<leader>o',
    heads = {
      { 'n', function()
        if vim.o.number == true then
          vim.o.number = false
        else
          vim.o.number = true
        end
      end, { desc = 'number' } },
      { 'r', function()
        if vim.o.relativenumber == true then
          vim.o.relativenumber = false
        else
          vim.o.number = true
          vim.o.relativenumber = true
        end
      end, { desc = 'relativenumber' } },
      { 'v', function()
        if vim.o.virtualedit == 'all' then
          vim.o.virtualedit = 'block'
        else
          vim.o.virtualedit = 'all'
        end
      end, { desc = 'virtualedit' } },
      { 'i', function()
        if vim.o.list == true then
          vim.o.list = false
        else
          vim.o.list = true
        end
      end, { desc = 'show invisible' } },
      { 's', function()
        if vim.o.spell == true then
          vim.o.spell = false
        else
          vim.o.spell = true
        end
      end, { exit = true, desc = 'spell' } },
      { 'w', function()
        if vim.o.wrap ~= true then
          vim.o.wrap = true
          -- Dealing with word wrap:
          -- If cursor is inside very long line in the file than wraps
          -- around several rows on the screen, then 'j' key moves you to
          -- the next line in the file, but not to the next row on the
          -- screen under your previous position as in other editors. These
          -- bindings fixes this.
          vim.keymap.set('n', 'k', function() return vim.v.count > 0 and 'k' or 'gk' end,
            { expr = true, desc = 'k or gk' })
          vim.keymap.set('n', 'j', function() return vim.v.count > 0 and 'j' or 'gj' end,
            { expr = true, desc = 'j or gj' })
        else
          vim.o.wrap = false
          vim.keymap.del('n', 'k')
          vim.keymap.del('n', 'j')
        end
      end, { desc = 'wrap' } },
      { 'c', function()
        if vim.o.cursorline == true then
          vim.o.cursorline = false
        else
          vim.o.cursorline = true
        end
      end, { desc = 'cursor line' } },
      { '<Esc>', nil, { exit = true } }
    }
  })
end

return M
