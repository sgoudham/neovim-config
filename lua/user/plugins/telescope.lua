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
