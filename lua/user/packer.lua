local fn = vim.fn

-- Automatically install Packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing Packer. Close and reopen Neovim..."
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Little to no config needed
    use { "andweeb/presence.nvim" }
    use { "tpope/vim-commentary" }
    use { "airblade/vim-rooter" }
    use { 'kyazdani42/nvim-web-devicons' }
    use { "tpope/vim-fugitive" }
    use { "godlygeek/tabular" }
    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("autosave").setup {
                enabled = true
            }
        end
    }
    use {
        "lewis6991/impatient.nvim",
        config = function()
            require("impatient")
        end
    }
    use {
        "Shatur/neovim-session-manager",
        config = function()
            require("session_manager").setup {
                autoload_mode = require("session_manager.config").AutoloadMode.Disabled
            }
        end
    }
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
            -- Disable AutoPairsShortcutJump being bound to ALT+N
            vim.g.AutoPairsShortcutJump = ''
        end
    }
    use {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup()
        end
    }
    use {
        "preservim/vim-markdown",
        config = function()
            vim.g.vim_markdown_folding_disabled = 1
        end
    }
    use {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup {
                input = {
                    insert_only = false
                }
            }
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end
    }


    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "java", "rust", "python", "lua" },
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
        end
    }
    use { "p00f/nvim-ts-rainbow" }

    -- Dashboard
    use {
        "glepnir/dashboard-nvim",
        config = function()
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
                    shortcut = '<leader> l s             ',
                    action = ':SessionManager load_session'
                },
                {
                    icon = '',
                    desc = 'Load Last Session                    ',
                    shortcut = '<leader> s l             ',
                    action = ':SessionManager load_last_session'
                },
                {
                    icon = '',
                    desc = 'Open Project                         ',
                    shortcut = '<leader> c d             ',
                    action = ":lua require'telescope'.extensions.project.project{}"
                },
                {
                    icon = '',
                    desc = 'Open Terminal                        ',
                    shortcut = '<leader> n               ',
                    action = ':FloatermNew'
                },
                {
                    icon = '',
                    desc = 'Update Plugins                       ',
                    shortcut = ':PackerSync              ',
                    action = ':PackerSync'
                },
                {
                    icon = '',
                    desc = 'View Installed LSP Servers           ',
                    shortcut = ':LspInstallInfo          ',
                    action = ':LspInstallInfo'
                }
            }
        end
    }

    -- Themes
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        branch = "dev",
        run = "CatppuccinCompile",
        config = function()
            local cp = require("catppuccin.palettes").get_palette()

            -- Add this once main branch is fully up to date with all breaking changes -> https://github.com/catppuccin/nvim/issues/178
            require("catppuccin").setup {
                term_colors = true,
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
                integrations = {
                    ts_rainbow = true
                },
                compile = {
                    enabled = true,
                },
                custom_highlights = {
                    ErrorMsg = { fg = cp.red, style = { "bold" } },

                    -- Treesitter overrides
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
        end
    }

    -- Lualine
    use {
        "nvim-lualine/lualine.nvim",
        config = function()
            local current_signature = function(width)
                if not pcall(require, 'lsp_signature') then return end
                local sig = require("lsp_signature").status_line(width)
                return sig.label .. "  🐼  " .. sig.hint
            end

            require("lualine").setup {
                options = {
                    theme = "catppuccin"
                },
                sections = {
                    lualine_c = { "filename", current_signature(30) }
                }
            }
        end
    }

    -- File explorer
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
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
        end
    }

    -- Floaterm
    use {
        "voldikss/vim-floaterm",
        config = function()
            vim.g.floaterm_shell = "powershell.exe"
            vim.g.floaterm_width = 0.8
            vim.g.floaterm_height = 0.8

            -- Set floaterm window foreground to gray once the cursor moves out from it
            vim.cmd [[hi FloatermNC guifg = gray]]
        end
    }

    -- Telescope
    use { "nvim-telescope/telescope-project.nvim" }
    use { "nvim-telescope/telescope-ui-select.nvim" }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-project.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzf-native.nvim"
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    find_files = {
                        hidden = true,
                        theme = 'dropdown'
                    },
                    live_grep = {
                        theme = 'dropdown'
                    },
                    lsp_references = {
                        theme = 'dropdown'
                    },
                    diagnostics = {
                        theme = 'dropdown'
                    }
                },
                defaults = {
                    layout_strategy = 'center',
                    layout_config = {
                        center = {
                            anchor = 'S'
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
                        require("telescope.themes").get_dropdown {}
                    },
                    project = {
                        theme = 'dropdown'
                    }
                }
            }

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("project")
        end
    }

    -- Gitsigns
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
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
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Actions
                    map({ 'n', 'v' }, '<leader>sh', ':Gitsigns stage_hunk<CR>')
                    map({ 'n', 'v' }, '<leader>rh', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hR', gs.reset_buffer)
                    map('n', '<leader>h', gs.preview_hunk)
                    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hD', function() gs.diffthis('~') end)
                    map('n', '<leader>td', gs.toggle_deleted)
                end
            }
        end
    }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/nvim-lsp-installer" }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-vsnip" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-cmdline" }
    use {
        "hrsh7th/vim-vsnip",
        requires = {
            { "hrsh7th/vim-vsnip-integ", after = "vim-vsnip" }
        }
    }
    use { "simrat39/rust-tools.nvim", branch = "modularize_and_inlay_rewrite" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
