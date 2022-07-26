local nvim_tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

-- Define Custom functions to simulate ranger's "going in" and "going out"
-- (might break if 'nvim-tree' is major refactored)
local get_node = require('nvim-tree.lib').get_node_at_cursor
local has_children = function(node) return type(node.nodes) == 'table' and vim.tbl_count(node.nodes) > 0 end
local key_down = vim.api.nvim_replace_termcodes('<Down>', true, true, true)

_G.go_in = function()
    local node = get_node()

    -- Don't go up if cursor is placed on '..'
    if node.name == '..' then
        vim.fn.feedkeys(key_down)
        return
    end

    -- Go inside if it is already an opened directory with children
    if has_children(node) and node.open == true then
        vim.fn.feedkeys(key_down)
        return
    end

    -- Peform 'edit' action
    nvim_tree.on_keypress('edit')

    -- Don't do anything if tree is not in focus
    if vim.api.nvim_buf_get_option(0, 'filetype') ~= 'NvimTree' then return end

    -- Go to first child node if it is a directory with children
    -- Get new node because before entries appear after first 'edit'
    node = get_node()
    if has_children(node) then vim.fn.feedkeys(key_down) end
end

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
                { key = "l", cb = ':lua go_in()<CR>' },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
        number = true,
        relativenumber = true,
    }
}
