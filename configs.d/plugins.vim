" Initialise impatient
lua require("impatient")

" Initialise autopairs
lua require("nvim-autopairs").setup()

" Initialise dressing.nvim
lua << EOF
require("dressing").setup {
    input = {
        insert_only = false
    }
}
EOF

" Initialise lspsaga
lua << EOF
local lspsaga = require("lspsaga")

lspsaga.init_lsp_saga {
    move_in_saga = { 
        prev = 'k', 
        next = 'j' 
    },
    code_action_lightbulb = {
        enable = false    
    },
    max_preview_lines = 50,
    finder_action_keys = {
        open = '<CR>',
        quit = '<ESC>',
        scroll_down = '<A-j>',
        scroll_up = '<A-k>'
    },
    code_action_keys = {
        quit = '<ESC>'     
    }
}
EOF

" Initialise neovim session manager
lua << EOF
require("session_manager").setup {
    autoload_mode = require("session_manager.config").AutoloadMode.Disabled
}
EOF

" Initialise lsp_signature
lua << EOF
require("lsp_signature").on_attach {
    doc_lines = 0,
    handler_opts = {
      border = "rounded"
    },
    hint_enable = false,
    max_width = 100,
    floating_window_above_cur_line = true
}
EOF

" Initialise treesitter
lua << EOF
local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
    ensure_installed = { "c", "java", "rust", "python" },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    rainbow = {
        enable = true,
        extended_mode = true
    }
}
EOF

" Initialise telescope
lua << EOF
require("telescope").setup {
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            vertical = {
                width = 0.5
            }
        },
        file_ignore_patterns = {
            ".git\\"
        },
        mappings = {
            n = {
                ["<A-j>"] = require("telescope.actions").preview_scrolling_down,
                ["<A-k>"] = require("telescope.actions").preview_scrolling_up
            }
        }
    },
    extensions = {
        ['ui-select'] = {
            require("telescope.themes").get_dropdown{}
        }
    }
}
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("project")
require("telescope").load_extension("repo")
EOF

" Initialise autosave
lua << EOF
local autosave = require("autosave")

autosave.setup {
    enabled = true,
}
EOF

" Initialise lualine
lua << EOF
local lualine = require("lualine")

lualine.setup {
  options = {
      theme = "catppuccin"
  }
}
EOF

" Initialise NvimTree
lua << EOF
local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  sync_root_with_cwd = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    icons = {
        show = {
            file = true,
            git = true,
            folder = true,
            folder_arrow = true
        }
    }
  },
  diagnostics = {
    enable = true
  },
  update_focused_file = {
    enable = true
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    mappings = {
      custom_only = false,
      list = {
          { key = "h", cb = tree_cb "close_node" },
          { key = "v", cb = tree_cb "vsplit" },
      },
    },
    number = true,
    relativenumber = true,
  }
}
EOF

" Gitsigns 
lua << EOF
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>sh', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>rh', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>h', gs.preview_hunk)
    map('n', '<leader>hb', function() gs.blame_line{full=true} end)
    map('n', '<leader>tb', gs.toggle_current_line_blame)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)
  end
}
EOF

" Floaterm
let g:floaterm_shell="powershell.exe"
let g:floaterm_width=0.8
let g:floaterm_height=0.8
" Set floaterm window foreground to gray once the cursor moves out from it
hi FloatermNC guifg=gray

" Initialise Dashboard
lua << EOF
local dashboard = require("dashboard")

dashboard.custom_header = {
        '                                                       ',
        '                                                       ',
        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
        '                                                       ',
        '              ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄              ',
        '              ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄              ',
        '             ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄              ',
        '             ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄              ',
        '            ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰              ',
        '            ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤              ',
        '           ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗              ',
        '           ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟               ',
        '           ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃               ',
        '           ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃               ',
        '            ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃                ',
        '             ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁                 ',
        '               ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁                   ',
        '                  ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴              ',
        '           ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿              ',
        '                                                       ',
        '                                                       ', 
}
dashboard.custom_center = {
    { 
        icon = '',
        desc = 'Load session                         ',
        shortcut = '<leader> l s',
        action = ':SessionManager load_session'
    },
    { 
        icon = '',
        desc = 'Load Last Session                    ',
        shortcut = '<leader> s l',
        action = ':SessionManager load_last_session'
    },
    { 
        icon = '',
        desc = 'Open Project                         ',
        shortcut = '<leader> c d',
        action = ":lua require'telescope'.extensions.project.project{}"
    },
    { 
        icon = '',
        desc = 'Open Terminal                        ',
        shortcut = '<leader> n  ',
        action = ':PlugUpdate'
    },
    { 
        icon = '',
        desc = 'Update Plugins                       ',
        shortcut = ':PlugUpdate ',
        action = ':PlugUpdate'
    }
}
EOF

" Quit Nvim if NvimTree is the last window
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif

" Set completeopt to have a better completion experience
" menuone: Popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Have a fixed column for the diagnostics to appear in
" This removes the jitter when warnings/errors appear
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua << EOF
local on_attach = function(client, bufnr)
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'fc', vim.lsp.buf.formatting, bufopts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space><space>", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>e', require("lspsaga.diagnostic").show_line_diagnostics, bufopts)
    vim.keymap.set("n", "[d", require("lspsaga.diagnostic").goto_prev, bufopts)
    vim.keymap.set("n", "]d", require("lspsaga.diagnostic").goto_next, bufopts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gd', require("telescope.builtin").lsp_references, bufopts)
    vim.keymap.set('n', '<leader>e', require("telescope.builtin").diagnostics, bufopts)
end

-- Always make sure to include this at the BEGINNING
require("nvim-lsp-installer").setup{
    ensure_installed = {
        "rust_analyzer", 
        "vimls",
        "jsonls",
        "marksman",
        "sumneko_lua"
    }
}

local nvim_lsp = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- RUST-ANALYZER
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
        on_attach = on_attach,
        capabilities = capabilities,
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

-- JSONLS
-- Enable (broadcasting) snippet capability for completion
local json_capabilities = vim.lsp.protocol.make_client_capabilities()
json_capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.jsonls.setup {
    on_attach = on_attach,
    capabilities = json_capabilities,
}

-- VIMLS
nvim_lsp.vimls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    diagnostic = {
        enable = true
    },
    isNeovim = true
}

-- MARKSMAN
nvim_lsp.marksman.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- SUMNEKO_LUA
nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua << EOF
local cmp = require('cmp')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup {
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  mapping = {
    ['<A-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
    ['<A-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<A-p>'] = cmp.mapping.scroll_docs(-4),
    ['<A-n>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping(cmp.mapping.close(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
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

cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' }
    }
})
EOF

" Initialise vim-markdown
let g:vim_markdown_folding_disabled=1

