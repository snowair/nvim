local M = {}

M.config = function()
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
                { 'branch',
                    color = { bg = "#e39527", fg = "#000000", gui = 'bold' },
                },
                'diff',
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
                        readonly = '[RO]', -- Text to show when the file is non-modifiable or readonly.
                        unnamed = '[No Name]', -- Text to show for unnamed buffers.
                    }
                },
                'diagnostics',
            },
            lualine_c = {},
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
        extensions = { 'quickfix',}
    }
end

return M
