local M = {}

function M.config()
    -- 可以参考某大佬的配置 https://github.com/ray-x/navigator.lua/blob/master/lua/navigator/lspclient/clients.lua
    -- lsp-format.nvim
    require("lsp-format").setup {}

    local lspconfig = require 'lspconfig'
    local util = lspconfig.util
    local uv = vim.loop
    local is_windows = uv.os_uname().version:match("Windows")
    local path_sep = is_windows and "\\" or "/"
    local strip_sep_pat = path_sep .. "$"
    local strip_dir_pat = path_sep .. "([^" .. path_sep .. "]+)$"
    local dirname = function(pathname)
        if not pathname or #pathname == 0 then
            return
        end
        local result = pathname:gsub(strip_sep_pat, ''):gsub(strip_dir_pat, '')
        if #result == 0 then
            return '/'
        end
        return result
    end

    -- nvim-lspconfig config
    -- List of all pre-configured LSP servers:
    -- github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    --
    -- Golang
    require 'lspconfig'.gopls.setup {
        {
            -- capabilities = cap,
            filetypes = { 'go', 'gomod', 'gohtmltmpl', 'gotexttmpl' },
            message_level = vim.lsp.protocol.MessageType.Error,
            cmd = {
                'gopls', -- share the gopls instance if there is one already
                '-remote=auto', --[[ debug options ]] --
                -- "-logfile=auto",
                -- "-debug=:0",
                '-remote.debug=:0',
                -- "-rpc.trace",
            },

            flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
            settings = {
                gopls = {
                    -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
                    -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
                    -- not supported
                    analyses = { unusedparams = true, unreachable = true },
                    codelenses = {
                        generate = true, -- show the `go generate` lens.
                        gc_details = true, --  // Show a code lens toggling the display of gc's choices.
                        test = true,
                        tidy = true,
                    },
                    usePlaceholders = true,
                    completeUnimported = true,
                    staticcheck = true,
                    matcher = 'fuzzy',
                    diagnosticsDelay = '500ms',
                    experimentalWatchedFileDelay = '1000ms',
                    symbolMatcher = 'fuzzy',
                    gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
                    buildFlags = { '-tags', 'integration' },
                },
            },
            root_dir = function(fname)
                return util.root_pattern('go.mod', '.git')(fname) or dirname(fname) -- util.path.dirname(fname)
            end,
        }
    }

    --Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    -- Html,css
    require 'lspconfig'.html.setup {
        capabilities = capabilities,
        on_attach = require "lsp-format".on_attach,
    }
    require 'lspconfig'.cssls.setup {
        on_attach = require "lsp-format".on_attach,
    }
    require 'lspconfig'.cssmodules_ls.setup {}

    -- js,ts,json
    vim.g.markdown_fenced_languages = {
        "ts=typescript"
    }
    require 'lspconfig'.jsonls.setup {
        on_attach = require "lsp-format".on_attach,
    }
    require 'lspconfig'.denols.setup {
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
            "typescript.tsx", "vue" },
        on_attach = require "lsp-format".on_attach,
    }

    -- npm i -g vscode-langservers-extracted
    require'lspconfig'.eslint.setup{}
    vim.cmd 'autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll'

    -- vue
    -- npm install vls -g
    require 'lspconfig'.vuels.setup {}

    -- dockerfile
    require 'lspconfig'.dockerls.setup {
        on_attach = require "lsp-format".on_attach,
    }

    -- bash
    -- npm i -g bash-language-server
    require 'lspconfig'.bashls.setup {}

    -- nanotee/sqls.nvim
    require 'lspconfig'.sqls.setup {
        on_attach = function(client, bufnr)
            require('sqls').on_attach(client, bufnr)
        end
    }

    -- lua
    -- https://github.com/sumneko/lua-language-server/wiki/PreCompiled-Binaries
    -- brew install lua-language-server
    require 'lspconfig'.sumneko_lua.setup {
        on_attach = require "lsp-format".on_attach,
        settings = {
            Lua = {
                runtime = {
                    version = 'Lua 5.4',
                    path = {
                        '?.lua',
                        '?/init.lua',
                        vim.fn.expand '~/.luarocks/share/lua/5.4/?.lua',
                        vim.fn.expand '~/.luarocks/share/lua/5.4/?/init.lua',
                        '/usr/share/5.4/?.lua',
                        '/usr/share/lua/5.4/?/init.lua',
                    }
                },
                diagnostics = {
                    globals = { 'vim' }, -- 让lsp server 识别 `vim`全局变量
                },
                workspace = {
                    library = {
                        vim.fn.expand '~/.luarocks/share/lua/5.3',
                        '/usr/share/lua/5.4',
                        '/usr/local/lib/lua'
                    }
                }
            }
        }
    }

    require 'lspconfig'.rust_analyzer.setup({
        settings = {
            ["rust-analyzer"] = {
                imports = {
                    granularity = {
                        group = "module",
                    },
                    prefix = "self",
                },
                cargo = {
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true
                },
            }
        }
    })


    require 'lspconfig'.java_language_server.setup {}

end

return M
