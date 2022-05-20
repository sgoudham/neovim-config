" Initialise impatient
lua require('impatient')
" Initialise lspsaga
lua require('lspsaga').setup()

" Initialise treesitter
lua << EOF
local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
    ensure_installed = { "c", "java", "rust", "python" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    }
}
EOF

" Initialise autosave
lua << EOF
local autosave = require("autosave")

autosave.setup {
    enabled = true,
}
EOF

" Initialise catppuccin
lua << EOF
local catppuccin = require("catppuccin")
local lualine = require("lualine")

catppuccin.setup {
    term_colors = true,
    styles = {
        variables = "NONE",
        keywords = "NONE",
        functions = "NONE"
    },
    integrations = {
        lsp_trouble = true,
        lsp_saga = true
    }
}

-- Current workaround for treesitter -> https://github.com/catppuccin/nvim/issues/95
local cp = require('catppuccin.api.colors').get_colors()
catppuccin.remap({
  	ErrorMsg = { fg = cp.red, style = "bold" },
    TSProperty = { fg = cp.yellow, style = "NONE" },
	TSInclude = { fg = cp.teal, style = "NONE" },
	TSOperator = { fg = cp.sky, style = "bold" },
	TSKeywordOperator = { fg = cp.sky, style = "bold" },
	TSPunctSpecial = { fg = cp.maroon, style = "bold" },
	TSFloat = { fg = cp.peach, style = "bold" },
	TSNumber = { fg = cp.peach, style = "bold" },
	TSBoolean = { fg = cp.peach, style = "bold" },
	TSConditional = { fg = cp.mauve, style = "bold" },
	TSRepeat = { fg = cp.mauve, style = "bold" },
	TSException = { fg = cp.peach, style = "NONE" },
	TSConstBuiltin = { fg = cp.lavender, style = "NONE" },
	TSFuncBuiltin = { fg = cp.peach, style = "NONE" },
	TSTypeBuiltin = { fg = cp.yellow, style = "NONE" },
	TSVariableBuiltin = { fg = cp.teal, style = "NONE" },
	TSFunction = { fg = cp.blue, style = "NONE" },
	TSParameter = { fg = cp.rosewater, style = "NONE" },
	TSKeywordFunction = { fg = cp.maroon, style = "NONE" },
	TSKeyword = { fg = cp.red, style = "NONE" },
	TSMethod = { fg = cp.blue, style = "NONE" },
	TSNamespace = { fg = cp.rosewater, style = "NONE" },
	TSStringRegex = { fg = cp.peach, style = "NONE" },
	TSVariable = { fg = cp.white, style = "NONE" },
	TSTagAttribute = { fg = cp.mauve, style = "NONE" },
	TSURI = { fg = cp.rosewater, style = "underline" },
	TSLiteral = { fg = cp.teal, style = "NONE" },
	TSEmphasis = { fg = cp.maroon, style = "NONE" },
	TSStringEscape = { fg = cp.pink, style = "NONE" },
	bashTSFuncBuiltin = { fg = cp.red, style = "NONE" },
	bashTSParameter = { fg = cp.yellow, style = "NONE" },
	typescriptTSProperty = { fg = cp.lavender, style = "NONE" },
	cssTSProperty = { fg = cp.yellow, style = "NONE" },
})
EOF


" Initialise lualine
lua << EOF
lualine.setup {
  options = {
    theme = "catppuccin"
  }
}
EOF


" Set completeopt to have a better completion experience
" menuone: Popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Have a fixed column for the diagnostics to appear in
" This removes the jitter when warnings/errors appear
set signcolumn=yes:1

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false, border = 'rounded', })


" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua << EOF
local nvim_lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('rust-tools').setup {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = false,
            other_hints_prefix = "<< "
            -- Enable following config when https://github.com/simrat39/rust-tools.nvim/issues/197 is resolved
            -- only_current_line = true,
            -- only_current_line_autocmd = "CursorMoved,CursorMovedI"
        },
    },

    -- See https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        capabilities = capabilities,
        settings = {
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                checkOnSave = {
                    command = "clippy",
                    allFeatures = true
                },
                completion = {
                    callable = {
                        snippets = "add_parentheses"
                    }
                }
            }
        }
    }
}
EOF

" Initialise lsp_signature
lua << EOF
require('lsp_signature').on_attach {
    doc_lines = 0,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = false,
    max_width = 100,
    floating_window_above_cur_line = true
}
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua << EOF
local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    ['<A-k>'] = cmp.mapping.select_prev_item(),
    ['<A-j>'] = cmp.mapping.select_next_item(),
    ['<A-p>'] = cmp.mapping.scroll_docs(-4),
    ['<A-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
        if cmp.visible() then
            local entry = cmp.get_selected_entry()
    	if not entry then
    	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
    	else
    	  cmp.confirm()
    	end
          else
            fallback()
          end
        end, {"i","s"}
    )
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' }
  },

  experimental = {
    ghost_text = true
  }
}
EOF




