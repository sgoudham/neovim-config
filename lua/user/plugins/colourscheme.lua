local cp = require("catppuccin.palettes").get_palette()

require("catppuccin").setup {
    term_colors = false,
    transparent_background = false,
    styles = {
        comments = {},
        conditionals = {},
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
    compile = {
        enabled = true
    },
    integrations = {
        ts_rainbow = true,
        native_lsp = {
            virtual_text = {
                errors = {},
                hints = {},
                warnings = {},
                information = {}
            }
        }
    },
    custom_highlights = {
        ErrorMsg = { fg = cp.red, style = { "bold" } },

        -- Treesitter
        TSProperty = { style = {} },
        TSInclude = { style = {} },
        TSOperator = { style = { "bold" } },
        TSKeywordOperator = { style = { "bold" } },
        TSPunctSpecial = { style = { "bold" } },
        TSFloat = { style = { "bold" } },
        TSNumber = { style = { "bold" } },
        TSBoolean = { style = { "bold" } },
        TSConditional = { style = { "bold" } },
        TSRepeat = { style = { "bold" } },
        TSException = { style = {} },
        TSConstBuiltin = { style = {} },
        TSFuncBuiltin = { style = {} },
        TSTypeBuiltin = { style = {} },
        TSVariableBuiltin = { style = {} },
        TSFunction = { style = {} },
        TSParameter = { style = {} },
        TSKeywordFunction = { style = {} },
        TSKeyword = { style = {} },
        TSMethod = { style = {} },
        TSNamespace = { style = {} },
        TSStringRegex = { style = {} },
        TSVariable = { style = {} },
        TSTagAttribute = { style = {} },
        TSURI = { style = { "underline" } },
        TSLiteral = { style = {} },
        TSEmphasis = { style = {} },
        TSStringEscape = { style = {} },

        -- String when matched fuzzily
        CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
        CmpItemAbbrMatchFuzzy = { fg = cp.blue, style = { "bold" } },

        -- Background of the completion menu & when item is selected
        PmenuSel = { bg = "#3A3A4A" }
    }
}

vim.g.catppuccin_flavour = "mocha"
vim.cmd [[colorscheme catppuccin]]

-- require("gruvbox").setup {
--     italic = false
-- }
-- vim.o.background = "dark"
-- vim.cmd [[colorscheme gruvbox]]
