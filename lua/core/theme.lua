-- themes
vim.opt.background = 'dark'


-- rose-pine
require('rose-pine').setup({
  dark_variant = 'moon', --- @usage 'main' | 'moon'
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = true,
  disable_float_background = false,
  disable_italics = false,

  --- @usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = 'base',
    panel = 'surface',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  -- Change specific vim highlight groups
  highlight_groups = {
    ColorColumn = { bg = 'rose' }
  }
})
--vim.cmd('colorscheme rose-pine')


-- nightfox
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,                -- Disable setting background
    terminal_colors = true,            -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,              -- Non focused panes set to alternative background
    styles = {                         -- Style to be applied to different syntax groups
      comments = "italic",             -- Value is any valid attr-list value `:help attr-list`
      conditionals = "bold",
      constants = "bold",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = { -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = { -- List of various plugins and additional options
      -- ...
    },
  }
})
vim.cmd("colorscheme duskfox")

-- catppuccin
vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
require("catppuccin").setup({
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = true,
  term_colors = false,
  compile = {
    enabled = false,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    leap = false,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
    mini = false,
    aerial = false,
    vimwiki = true,
    beacon = true,
  },
  color_overrides = {},
  custom_highlights = {},
})
--vim.cmd [[colorscheme catppuccin]]


-- Default options:
--require("gruvbox").setup({
--undercurl = true,
--underline = true,
--bold = true,
--italic = true,
--strikethrough = true,
--invert_selection = false,
--invert_signs = false,
--invert_tabline = false,
--invert_intend_guides = false,
--inverse = true, -- invert background for search, diffs, statuslines and errors
--contrast = "", -- can be "hard", "soft" or empty string
--overrides = {},
--})
--vim.cmd("colorscheme gruvbox")

