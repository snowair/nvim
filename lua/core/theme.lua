-- themes
vim.opt.background = 'dark'


-- rose-pine
--require('rose-pine').setup({
--dark_variant = 'moon', --- @usage 'main' | 'moon'
--bold_vert_split = false,
--dim_nc_background = false,
--disable_background = false,
--disable_float_background = false,
--disable_italics = false,

----- @usage string hex value or named color from rosepinetheme.com/palette
--groups = {
--background = 'base',
--panel = 'surface',
--border = 'highlight_med',
--comment = 'muted',
--link = 'iris',
--punctuation = 'subtle',

--error = 'love',
--hint = 'iris',
--info = 'foam',
--warn = 'gold',

--headings = {
--h1 = 'iris',
--h2 = 'foam',
--h3 = 'rose',
--h4 = 'gold',
--h5 = 'pine',
--h6 = 'foam',
--}
---- or set all headings at once
---- headings = 'subtle'
--},

---- Change specific vim highlight groups
--highlight_groups = {
--ColorColumn = { bg = 'rose' }
--}
--})
--vim.cmd('colorscheme rose-pine')


-- nightfox
require('nightfox').setup({
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath("cache") .. "/nightfox",
        compile_file_suffix = "_compiled", -- Compiled file suffix
        transparent = false, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = false, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
            comments = "italic", -- Value is any valid attr-list value `:help attr-list`
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


--require('onenord').setup({
--borders = true, -- Split window borders
--fade_nc = false, -- Fade non-current windows, making them more distinguishable
---- Style that is applied to various groups: see `highlight-args` for options
--styles = {
--comments = "NONE",
--strings = "NONE",
--keywords = "NONE",
--functions = "NONE",
--variables = "NONE",
--diagnostics = "underline",
--},
--disable = {
--background = false, -- Disable setting the background color
--cursorline = false, -- Disable the cursorline
--eob_lines = true, -- Hide the end-of-buffer lines
--},
---- Inverse highlight for different groups
--inverse = {
--match_paren = false,
--},
--custom_highlights = {}, -- Overwrite default highlight groups
--custom_colors = {}, -- Overwrite default colors
--})
--vim.cmd("colorscheme onenord")

---- kanagawa
--require('kanagawa').setup({
--undercurl = true,           -- enable undercurls
--commentStyle = { italic = true },
--functionStyle = {},
--keywordStyle = { italic = true},
--statementStyle = { bold = true },
--typeStyle = {},
--variablebuiltinStyle = { italic = true},
--specialReturn = true,       -- special highlight for the return keyword
--specialException = true,    -- special highlight for exception handling keywords
--transparent = false,        -- do not set background color
--dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
--globalStatus = false,       -- adjust window separators highlight for laststatus=3
--terminalColors = true,      -- define vim.g.terminal_color_{0,17}
--colors = {},
--overrides = {},
--})
---- setup must be called before loading
--vim.cmd("colorscheme kanagawa")

-- catppuccin
--vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
--require("catppuccin").setup({
--dim_inactive = {
--enabled = false,
--shade = "dark",
--percentage = 0.15,
--},
--transparent_background = false,
--term_colors = false,
--compile = {
--enabled = false,
--path = vim.fn.stdpath "cache" .. "/catppuccin",
--},
--styles = {
--comments = { "italic" },
--conditionals = { "italic" },
--loops = {},
--functions = {},
--keywords = {},
--strings = {},
--variables = {},
--numbers = {},
--booleans = {},
--properties = {},
--types = {},
--operators = {},
--},
--integrations = {
--treesitter = true,
--native_lsp = {
--enabled = true,
--virtual_text = {
--errors = { "italic" },
--hints = { "italic" },
--warnings = { "italic" },
--information = { "italic" },
--},
--underlines = {
--errors = { "underline" },
--hints = { "underline" },
--warnings = { "underline" },
--information = { "underline" },
--},
--},
--coc_nvim = false,
--lsp_trouble = false,
--cmp = true,
--lsp_saga = false,
--gitgutter = false,
--gitsigns = true,
--leap = false,
--telescope = true,
--nvimtree = {
--enabled = true,
--show_root = true,
--transparent_panel = false,
--},
--neotree = {
--enabled = false,
--show_root = true,
--transparent_panel = false,
--},
--dap = {
--enabled = false,
--enable_ui = false,
--},
--which_key = false,
--indent_blankline = {
--enabled = true,
--colored_indent_levels = false,
--},
--dashboard = true,
--neogit = false,
--vim_sneak = false,
--fern = false,
--barbar = false,
--bufferline = true,
--markdown = true,
--lightspeed = false,
--ts_rainbow = false,
--hop = false,
--notify = true,
--telekasten = true,
--symbols_outline = true,
--mini = false,
--aerial = false,
--vimwiki = true,
--beacon = true,
--},
--color_overrides = {},
--custom_highlights = {},
--})
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
        lualine_b = { 'diagnostics',
            'branch',
            {
                'filename',
                file_status = true, -- Displays file status (readonly status, modified status)
                path = 1, -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                -- for other components. (terrible name, any suggestions?)
                symbols = {
                    modified = '[+]', -- Text to show when the file is modified.
                    readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
                    unnamed = '[No Name]', -- Text to show for unnamed buffers.
                }
            },
        },
        lualine_c = {},
        lualine_x = { 'fileformat' },
        lualine_y = { 'filetype', 'encoding', 'filesize', 'location' },
        lualine_z = {
            { 'progress', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = {
            'filename', -- TODO: 样式很不明显,改进一下
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = { 'quickfix', 'chadtree', 'nvim-tree', 'symbols-outline', 'toggleterm' }
}
