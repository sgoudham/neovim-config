local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

nvim_tree.setup {
    disable_netrw = true,
    sync_root_with_cwd = true,
    diagnostics = {
        enable = true
    },
    update_focused_file = {
        enable = true
    },
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "h", cb = tree_cb "close_node" },
                { key = "l", cb = tree_cb "edit" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = true,
        relativenumber = true,
    }
}
