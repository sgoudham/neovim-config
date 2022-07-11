require("rust-tools").setup {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = false,
            other_hints_prefix = "<< ",
            -- Enable following config when https://github.com/simrat39/rust-tools.nvim/issues/197 is resolved
            only_current_line = true,
            only_current_line_autocmd = "CursorMoved,CursorMovedI"
        },
    },

    -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        on_attach = require("user.lsp.handlers").on_attach,
        capabilities = require("user.lsp.handlers").capabilities,
        settings = {
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy"
                },
                completion = {
                    callable = {
                        snippets = "fill_arguments"
                    }
                }
            }
        }
    }
}
