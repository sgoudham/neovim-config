require("lsp_signature").on_attach {
    doc_lines = 0,
    handler_opts = {
        border = "rounded"
    },
    hint_enable = false,
    max_width = 100,
    floating_window_above_cur_line = true
}
