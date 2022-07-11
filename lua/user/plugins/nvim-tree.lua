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
