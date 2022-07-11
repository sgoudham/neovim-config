local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

vim.diagnostic.config {
    float = {
        border = "rounded"
    }
}

local function lsp_keymaps(client, bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, "n", "gs", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
    keymap(bufnr, "n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
    keymap(bufnr, "n", "gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)
    keymap(bufnr, "n", "<leader>e", ":lua require('telescope.builtin').diagnostics()<CR>", opts)
    keymap(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    keymap(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    keymap(bufnr, "n", "fc", ":lua vim.lsp.buf.formatting()<CR>", opts)
    keymap(bufnr, "n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", opts)
    keymap(bufnr, "n", "<space><space>", ":lua vim.lsp.buf.code_action()<CR>", opts)
    keymap(bufnr, "n", "<leader>li", ":LspInfo<CR>", opts)
    keymap(bufnr, "n", "<leader>lI", ":LspInstallInfo<CR>", opts)
    keymap(bufnr, "n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
    keymap(bufnr, "n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap(bufnr, "n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", opts)
    keymap(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)

    require("lsp_signature").on_attach({
        bind = true,
        doc_lines = 0,
        handler_opts = {
            border = "rounded"
        },
        hint_enable = false,
        max_width = 100,
        floating_window_above_cur_line = true
    }, bufnr)

    if client.name == "rust_analyzer" then
        keymap(bufnr, "n", "<leader>t", ":RustRunnables<CR>", opts)
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
end


return M
