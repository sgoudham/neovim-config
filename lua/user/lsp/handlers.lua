local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = require("cmp_nvim_lsp").update_capabilities(M.capabilities)

vim.diagnostic.config {
    update_in_insert = true,
    float = {
        border = "rounded"
    }
}

local function lsp_keymaps(client, bufnr)
    local opts = { noremap = true, silent = true }
    local map = vim.api.nvim_buf_set_keymap

    map(bufnr, "n", "gs", ":lua require('telescope.builtin').lsp_definitions()<CR>", opts)
    map(bufnr, "n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
    map(bufnr, "n", "gi", ":lua require('telescope.builtin').lsp_implementations()<CR>", opts)
    map(bufnr, "n", "<leader>e", ":lua require('telescope.builtin').diagnostics()<CR>", opts)
    map(bufnr, "n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
    map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
    map(bufnr, "n", "fc", ":lua vim.lsp.buf.formatting()<CR>", opts)
    map(bufnr, "n", "<space>e", ":lua vim.diagnostic.open_float()<CR>", opts)
    map(bufnr, "n", "<space><space>", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map(bufnr, "n", "<leader>li", ":LspInfo<CR>", opts)
    map(bufnr, "n", "<leader>lI", ":LspInstallInfo<CR>", opts)
    map(bufnr, "n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opts)
    map(bufnr, "n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opts)
    map(bufnr, "n", "<leader>r", ":lua vim.lsp.buf.rename()<CR>", opts)
    map(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)

    if client.name == "rust_analyzer" then
        map(bufnr, "n", "<leader>t", ":RustRunnables<CR>", opts)
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
end

return M
