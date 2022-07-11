local catppuccin = require("catppuccin")

catppuccin.setup {
    term_colors = true,
    transparent_background = false,
    styles = {
        comments = "NONE",
        conditionals = "NONE",
        loops = "NONE",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
        numbers = "NONE",
        booleans = "NONE",
        properties = "NONE",
        types = "NONE",
        operators = "NONE",
    },
    integrations = {
        nvimtree = {
            show_root = true
        },
        lsp_trouble = true,
        lsp_saga = true,
        ts_rainbow = true
    }
}

local cp = require("catppuccin.api.colors").get_colors()

catppuccin.remap({
    ErrorMsg = { fg = cp.red, style = "bold" },
    TSProperty = { style = "NONE" },
    TSInclude = { style = "NONE" },
    TSOperator = { style = "bold" },
    TSKeywordOperator = { style = "bold" },
    TSPunctSpecial = { style = "bold" },
    TSFloat = { style = "bold" },
    TSNumber = { style = "bold" },
    TSBoolean = { style = "bold" },
    TSConditional = { style = "bold" },
    TSRepeat = { style = "bold" },
    TSException = { style = "NONE" },
    TSConstBuiltin = { style = "NONE" },
    TSFuncBuiltin = { style = "NONE" },
    TSTypeBuiltin = { style = "NONE" },
    TSVariableBuiltin = { style = "NONE" },
    TSFunction = { style = "NONE" },
    TSParameter = { style = "NONE" },
    TSKeywordFunction = { style = "NONE" },
    TSKeyword = { style = "NONE" },
    TSMethod = { style = "NONE" },
    TSNamespace = { style = "NONE" },
    TSStringRegex = { style = "NONE" },
    TSVariable = { style = "NONE" },
    TSTagAttribute = { style = "NONE" },
    TSURI = { style = "underline" },
    TSLiteral = { style = "NONE" },
    TSEmphasis = { style = "NONE" },
    TSStringEscape = { style = "NONE" },
    DiagnosticInfo = { style = "NONE", bg = "NONE" },
    DiagnosticError = { style = "NONE", bg = "NONE" },
    DiagnosticHint = { style = "NONE", bg = "NONE" },
    DiagnosticWarn = { style = "NONE", bg = "NONE" },
    LspSagaDiagnosticBorder = { fg = cp.blue },
    LspSagaDiagnosticHeader = { fg = cp.lavender },
    -- String when matched fuzzily
    CmpItemAbbrMatch = { fg = cp.blue, style = "bold" },
    CmpItemAbbrMatchFuzzy = { fg = cp.blue, style = "bold" },
    -- Background of the completion menu & when item is selected
    PmenuSel = { bg = "#3A3A4A" }
})

vim.g.catppuccin_flavour = "mocha"
vim.cmd [[colorscheme catppuccin]]
