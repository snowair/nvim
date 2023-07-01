local M = {}
local has_words_before = function()
    ---@diagnostic disable-next-line: deprecated
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
function M.config()
    -- Setup nvim-cmp.
    local kind_icons = {
        Text = "",
        Method = "m",
        Function = "",
        Constructor = "",
        Field = "",
        Variable = "",
        Class = "",
        Interface = "",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Event = "",
        Operator = "",
        TypeParameter = "",
    }
    local cmp = require 'cmp'
    local compare = require('cmp.config.compare')
    cmp.setup({
        sorting = {
            priority_weight = 2,
            comparators = {
                -- require('cmp_tabnine.compare'),
                compare.offset,
                compare.exact,
                compare.score,
                compare.recently_used,
                compare.kind,
                compare.sort_text,
                compare.length,
                compare.order,
            },
        },
    })
    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- 文档后翻页
            ['<C-f>'] = cmp.mapping.scroll_docs(4), -- 文档前翻页
            ['<C-Space>'] = cmp.mapping.complete(), -- 展开自动完成提示
            ['<C-e>'] = cmp.mapping.abort(), -- 收起自动完成提示
            -- 确认选择, select = true 则,每页选择的时候,默认选择第一个
            ['<CR>'] = cmp.mapping.confirm({ select = true }),

            -- tab/s-tab 需要兼容Luasnip
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        }),

        snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                -- luasnip
                require('luasnip').lsp_expand(args.body)
            end,
        },

        window = {
            --completion = cmp.config.window.bordered(),
            --documentation = cmp.config.window.bordered(),
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snip]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    cmdline = "[Cmdline]",
                    git = "[git]",
                    golang_time = "[Time]",
                    golang_json = "[Tag]",
                    nvim_lua = "[Lua]",
                    -- cmp_tabnine = "[T9]",
                })[entry.source.name]
                return vim_item
            end,
        },
        -- 当设置多个自动完成source时,可以按优先级分组，每个优先级一组作为一个参数传入
        -- 下面的配置，第一优先级是 nvim_lsp,luasnip; 第二优先级是buffer,path
        -- 下面的source 都是插件提供的
        sources = cmp.config.sources(
            {
                -- { name = 'cmp_tabnine' },
                { name = 'nvim_lsp' }, -- lsp 提供的自动完成
                { name = 'luasnip' }, -- luasnip 插件提供的 snippets自动完成
                { name = 'nvim_lua' }, --  cmp-nvim-lua 插件提供的 neovim api自动完成
            },
            {
                { name = 'buffer' }, -- cmp-buffer插件
                { name = 'path' }, --cmp-path插件
                { name = 'emoji' }, -- cmp-emoji 插件
            })
    })

    local devicons = require('nvim-web-devicons')
    cmp.register_source('devicons', {
        complete = function(_, _, callback)
            local items = {}
            for _, icon in pairs(devicons.get_icons()) do
                table.insert(items, {
                    label = icon.icon .. '  ' .. icon.name,
                    insertText = icon.icon,
                    filterText = icon.name,
                })
            end
            callback({ items = items })
        end,
    })

    -- nvim-cmp for commands
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'c' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'c' }),
        }),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { 'c' }),

            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'c' }),
        }),
        sources = cmp.config.sources(
            {
                { name = 'path' },
                { name = 'cmdline' },
                { name = 'git' },
            })
    })
end

return M
